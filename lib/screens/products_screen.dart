import 'package:ecommerce_flogics/constants/font_sizes/font_sizes.dart';
import 'package:ecommerce_flogics/constants/paths/route_paths.dart';
import 'package:ecommerce_flogics/models/get_all_products_response.dart';
import 'package:ecommerce_flogics/providers/products_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, productsProvider, child) {
        return RefreshIndicator(
          onRefresh: () async {
            await context.read<ProductsProvider>().getAllProducts();
          },
          child: (productsProvider.products == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0,right: 16,left: 16),
                    child: Text("Products",style: TextStyle(fontWeight: FontWeight.bold,fontSize: FontSizes.FONT_SIZE_22),),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: productsProvider.products?.length,
                        padding: EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          var product = productsProvider.products?[index];

                          return GestureDetector(
                            onTap: () async {
                              await context.read<ProductsProvider>().setSelectedProduct(product?.id);
                              Navigator.pushNamed(context, RoutePaths.PRODUCT_DETAILS_SCREEN_ROUTE_ID);

                            },
                            child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          child: Image.network(
                                        product?.image ?? "",
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      )),
                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product?.title ?? "",
                                              style: TextStyle(
                                                  fontSize: FontSizes.FONT_SIZE_14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              product?.category.name ?? "",
                                              style: TextStyle(
                                                fontSize: FontSizes.FONT_SIZE_12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    Text(
                                                      product?.rating.rate.toString() ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize:
                                                              FontSizes.FONT_SIZE_12,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${product?.rating.count.toString() ?? ""} ratings",
                                                  style: TextStyle(
                                                    fontSize: FontSizes.FONT_SIZE_12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "${product?.price.toString() ?? ""}\$",
                                              style: TextStyle(
                                                  fontSize: FontSizes.FONT_SIZE_14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        }),
                  ),
                ],
              ),
        );
      },
    );
  }
}
