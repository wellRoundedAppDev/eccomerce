import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_flogics/models/get_all_products_response.dart';
import 'package:ecommerce_flogics/models/user_login_input.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/server_urls/api_urls.dart';
import '../models/login_api_response.dart';

class ProductsApis {
  ProductsApis._() {
    // Attach Logger
    if (kDebugMode) _dio.interceptors.add(_logger);
  }

  static final ProductsApis instance = ProductsApis._();

  // Http Client
  final Dio _dio = Dio();

  // Headers
  final Map<String, dynamic> _apiHeaders = <String, dynamic>{
    "Accept-Language": "ar",

    // 'Content-Type': 'multipart/form-data',
  };

  // Logger
  final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    error: true,
  );

  Future<List<ProductResponse>?> getAllProducts() async {
    try {
      final _response = await _dio.get(
        '${ApiUrls.BASIC_URL}${ApiUrls.GET_PRODUCTS_ENDPOINT}',
        options: Options(
          headers: {
            ..._apiHeaders,
          },
        ),
      );
      if (_validResponse(
        _response.statusCode!,
      )) {

        return getAllProductsResponseFromJson(        jsonEncode(_response.data)
        );
      }
    } catch (e) {
      print("Dio error: $e");
    }
  }

  Future<ProductResponse?> getProduct(int productId) async {
    try {
      final _response = await _dio.get(
        '${ApiUrls.BASIC_URL}${ApiUrls.GET_PRODUCTS_ENDPOINT}/$productId',
        options: Options(
          headers: {
            ..._apiHeaders,
          },
        ),
      );
      if (_validResponse(
        _response.statusCode!,
      )) {

        print(_response.data);
        return ProductResponse.fromJson(_response.data);
      }
    } catch (e) {
      print("Dio error: $e");
    }
  }


  bool _validResponse(
      int statusCode,
      ) {
    return (statusCode >= 200 && statusCode < 300);
  }
}
