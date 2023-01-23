import 'package:ecommerce_flogics/apis/profile_apis.dart';
import 'package:ecommerce_flogics/models/profile_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier{

  var _profileApi = ProfileApis.instance;

  ProfileResponse? userProfile;

   getUserProfile() async {

    userProfile = await _profileApi.getUserProfile();
    notifyListeners();
  }

}