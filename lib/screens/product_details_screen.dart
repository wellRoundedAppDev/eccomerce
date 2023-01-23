import 'package:ecommerce_flogics/constants/font_sizes/font_sizes.dart';
import 'package:ecommerce_flogics/constants/paths/icon_paths.dart';
import 'package:ecommerce_flogics/constants/paths/route_paths.dart';
import 'package:ecommerce_flogics/providers/cart_provider.dart';
import 'package:ecommerce_flogics/providers/products_provider.dart';
import 'package:ecommerce_flogics/shared_widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 8,bottom: 8,right: 8),
          child: PrimaryButton(text: Strings.ADD_TO_CART_ENG, action: () {
            var selectedProduct = context.read<ProductsProvider>().selectedProduct;
            Map<String,dynamic> selectedProductMap = {
              "product":selectedProduct,
              "quantity":1
            };
            context.read<CartProvider>().addProductToCart(selectedProductMap,context);
          }),
        ),
        body: Consumer<ProductsProvider>(
            builder: (context, productsProvider, child) {
          String imagePath = productsProvider.selectedProduct?.image ?? "";
          String title = productsProvider.selectedProduct?.title ?? "";
          String desc = productsProvider.selectedProduct?.description ?? "";
          String category =
              productsProvider.selectedProduct?.category.name ?? "";
          String rating =
              productsProvider.selectedProduct?.rating.rate.toString() ?? "";
          String ratersCount =
              productsProvider.selectedProduct?.rating.count.toString() ?? "";
          String price =
              productsProvider.selectedProduct?.price.toString() ?? "";

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 35,
                          )),
                    ),

                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RoutePaths.CART_SCREEN_ROUTE_ID);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(IconPaths.SHOPPING_CART_ICON,width: 40,height: 40,),
                      ),
                    )
                 
                  ]),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                          child: Image.network(
                        imagePath,
                        width: 200,
                        height: 200,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSizes.FONT_SIZE_22),
                      ),
                      Text(
                        category,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                rating,
                                style: TextStyle(
                                    fontSize: FontSizes.FONT_SIZE_12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$ratersCount ratings",
                            style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Price: $price \$",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        desc,
                        style: TextStyle(fontSize: FontSizes.FONT_SIZE_16),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
