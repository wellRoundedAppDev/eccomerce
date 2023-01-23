import 'package:dio/dio.dart';
import 'package:ecommerce_flogics/models/profile_response.dart';
import 'package:ecommerce_flogics/models/user_login_input.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/server_urls/api_urls.dart';
import '../models/login_api_response.dart';

class ProfileApis {
  ProfileApis._() {
    // Attach Logger
    if (kDebugMode) _dio.interceptors.add(_logger);
  }

  static final ProfileApis instance = ProfileApis._();

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

  Future<ProfileResponse?> getUserProfile(
      ) async {
    try {
      final _response = await _dio.get(
        '${ApiUrls.BASIC_URL}${ApiUrls.GET_PROFILE_ENDPOINT}',
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
        return ProfileResponse.fromJson(_response.data);
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
