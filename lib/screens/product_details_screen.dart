import 'package:ecommerce_flogics/constants/font_sizes/font_sizes.dart';
import 'package:ecommerce_flogics/providers/products_provider.dart';
import 'package:ecommerce_flogics/shared_widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 8,bottom: 8,right: 8),
          child: PrimaryButton(text: "Add To Cart", action: () {}),
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
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 35,
                          )),
                    ),
                    Spacer()
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
