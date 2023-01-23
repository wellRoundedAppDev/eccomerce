import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_flogics/models/get_all_products_response.dart';
import 'package:ecommerce_flogics/models/user_cart_response.dart';
import 'package:ecommerce_flogics/models/user_login_input.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/server_urls/api_urls.dart';
import '../models/login_api_response.dart';

class CartApis {
  CartApis._() {
    // Attach Logger
    if (kDebugMode) _dio.interceptors.add(_logger);
  }

  static final CartApis instance = CartApis._();

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

  Future<List<UserCartResponse>?> getUserCart() async {
    try {
      final _response = await _dio.get(
        '${ApiUrls.BASIC_URL}${ApiUrls.GET_USER_CART_ENDPOINT}1',
        options: Options(
          headers: {
            ..._apiHeaders,
          },
        ),
      );
      if (_validResponse(
        _response.statusCode!,
      )) {

        return userCartResponseFromJson(        jsonEncode(_response.data)
        );
      }
    } catch (e) {
      print("Dio error: $e");
    }
  }

  Future<bool?> addProductToCart() async {
    try {
      final _response = await _dio.post(
        '${ApiUrls.BASIC_URL}${ApiUrls.CART_ENDPOINT}',
        data:  {
          "userId":1,
          "date":2020-02-03,
          "products":[{"productId":5,"quantity":1},{"productId":1,"quantity":5}]
        },
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
        return true;
      }else{
        return false;
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
