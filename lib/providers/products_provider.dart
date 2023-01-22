import 'package:ecommerce_flogics/apis/products_apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/get_all_products_response.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsApis _productsApi = ProductsApis.instance;
  List<ProductResponse>? products;
  ProductResponse? selectedProduct;

  getAllProducts() async {
    products = await _productsApi.getAllProducts();
    notifyListeners();
  }

  getSelectedProduct(int? id) async {
    if(id == null){
      return;
    }
    selectedProduct = await _productsApi.getProduct(id);
    notifyListeners();
  }
}
