import 'package:ecommerce_flogics/models/user_login_input.dart';
import 'package:flutter/cupertino.dart';

import '../apis/authentication_apis.dart';
import '../models/login_api_response.dart';

class AuthProvider  {

  AuthApis _apiAccount = AuthApis.instance;
  LoginApiResponse? loginResponse;


  String responseMessage = "";//error msgs from auth
  String token = "";


  Future<bool> login(UserLoginInput user) async {
    loginResponse = await _apiAccount.loginWithEmail(user: user);
    if(loginResponse == null){
      responseMessage = "Login failed";
      return false;
    }

    token = loginResponse?.token??"";
    return true;
  }

}
