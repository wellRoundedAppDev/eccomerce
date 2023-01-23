import 'package:ecommerce_flogics/constants/font_sizes/font_sizes.dart';
import 'package:ecommerce_flogics/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';
import '../shared_widgets/primary_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8, right: 8),
          child: PrimaryButton(
              text: Strings.PROCEED_TO_CHECKOUT_ENG, action: () {
                context.read<CartProvider>().calculateCartTotalPrice();
          }),
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
