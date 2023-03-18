import 'package:ecommerce_flogics/constants/colors/colors.dart';
import 'package:ecommerce_flogics/constants/font_sizes/font_sizes.dart';
import 'package:ecommerce_flogics/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';
import '../shared_widgets/primary_button.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8, right: 8),
          child:
          Consumer<CartProvider>(
            builder: (context,cartProvider,child){
              return Row(
                children: [
                  Expanded(
                    child: GooglePayButton(

                      onError: (e){
                        print(e);
                      },
                      onPressed: (){
                        context.read<CartProvider>().createPaymentItems();
                      },
                      paymentConfigurationAsset:  "pay_config/gpay.json",
                      paymentItems: cartProvider.paymentItems??[],
                      type: GooglePayButtonType.pay,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: (data){
                        print(data);
                      },
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ApplePayButton(
               paymentConfigurationAsset:"pay_config/apple_pay.json" ,
                      paymentItems: cartProvider.paymentItems??[],
                      style: ApplePayButtonStyle.black,
                      type: ApplePayButtonType.buy,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: (data){
                        print(data);
                      },
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // PrimaryButton(
          //     text: Strings.PROCEED_TO_CHECKOUT_ENG, action: () {
          //       context.read<CartProvider>().calculateCartTotalPrice();
          //       double totalPrice = context.read<CartProvider>().totalCartPrice;
          //       showDialog(context: context, builder: (context){
          //        return AlertDialog(title: Text("Total Price"),
          //          actions: [
          //
          //          GestureDetector(
          //            onTap: (){
          //              Navigator.pop(context);
          //            },
          //            child: Padding(
          //              padding: const EdgeInsets.all(8.0),
          //              child: Text("Buy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: FontSizes.FONT_SIZE_22,color: AppColors.APP_MAIN_COLOR),),
          //            ),
          //          )
          //         ],content: Text(totalPrice.toString()),
          //        );
          //       });
          //
          // }),
        ),
        body: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            var products = cartProvider.productsInCart;
            return (products.isEmpty)
                ? Center(
                    child: Text(
                      "Cart is Empty",
                      style: TextStyle(fontSize: FontSizes.FONT_SIZE_32),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, right: 16, left: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My cart",
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_22,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                                onTap: () {
                                  context.read<CartProvider>().deleteCart();
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(16),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              var productInCart = products[index];
                              return Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<CartProvider>()
                                                    .deleteProductFromCart(
                                                        productInCart);
                                              },
                                              child: Icon(
                                                Icons.delete_outline,
                                                color: Colors.grey,
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            productInCart["product"].image,
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Title ${productInCart["product"].title}"),
                                                Text(
                                                    "Price ${productInCart["product"].price.toString()}"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              int quantity =
                                                  productInCart['quantity'];
                                              if (quantity == 1) {
                                                return;
                                              }
                                              quantity--;
                                              context
                                                  .read<CartProvider>()
                                                  .updateProductInCart(
                                                      index, quantity);
                                            },
                                            child: Card(
                                                child: Icon(
                                              Icons.remove,
                                              size: 35,
                                            )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              "${productInCart["quantity"].toString()}",
                                              style: TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_22),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              int quantity =
                                                  productInCart['quantity'];
                                              quantity++;
                                              context
                                                  .read<CartProvider>()
                                                  .updateProductInCart(
                                                      index, quantity);
                                            },
                                            child: Card(
                                                child: Icon(
                                              Icons.add,
                                              size: 35,
                                            )),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
