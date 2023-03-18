import 'package:ecommerce_flogics/apis/cart_apis.dart';
import 'package:ecommerce_flogics/models/get_all_products_response.dart';
import 'package:ecommerce_flogics/models/user_cart_response.dart';
import 'package:ecommerce_flogics/providers/products_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  var _cartApi = CartApis.instance;
  List<UserCartResponse>? userCarts = [];
  List<Map<String, dynamic>> productsInCart = [];
  double totalCartPrice = 0;
  List<PaymentItem>? paymentItems;

  getUserCarts(BuildContext context) async {
    productsInCart.clear();
    userCarts = await _cartApi.getUserCart();
    userCarts?.forEach((element) {
      element.products.forEach((element) async {
        ProductResponse? product = await context
            .read<ProductsProvider>()
            .getProductById(element.productId);
        int productQuantity = element.quantity;
        productsInCart.add({"product": product, "quantity": productQuantity});
        notifyListeners();
      });
    });
    // productsInCart.forEach((element) {print(element["quantity"]);});
  }

  deleteProductFromCart(Map product) {
    productsInCart.remove(product);
    notifyListeners();
  }

  deleteCart() {
    productsInCart.clear();
    notifyListeners();
  }

  updateProductInCart(int index, int quantity) {
    productsInCart[index]['quantity'] = quantity;
    notifyListeners();
  }

  addProductToCart(Map<String, dynamic> product,BuildContext context) {
    //send transaction to server then update UI
    _cartApi.addProductToCart().then((success) {
      if (success == true) {
        productsInCart.add(product);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Added To Cart")));

      }
    });

    notifyListeners();
  }

  calculateCartTotalPrice(){
    totalCartPrice = 0;
    productsInCart.forEach((element) {
      totalCartPrice += element["product"].price * element["quantity"];
    });
    print(totalCartPrice);
    notifyListeners();
  }

  createPaymentItems(){
    paymentItems = productsInCart.map<PaymentItem>((e){
      return PaymentItem(amount: e["product"].price.toString(),label: e['product'].title.toString(),);
    }).toList();
    print(paymentItems?.last.amount);
    notifyListeners();
  }
}
