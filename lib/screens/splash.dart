import 'package:ecommerce_flogics/constants/paths/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constants/colors/colors.dart';
import '../constants/font_sizes/font_sizes.dart';
import '../providers/cart_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Future.delayed(
      Duration(seconds: 3),
      () {

        Navigator.pushReplacementNamed(context, RoutePaths.LOGIN_SCREEN_ROUTE_ID);
      }
    );
  }

  @override
  Widget build(BuildContext context) {

        return SafeArea(
                child: Scaffold(
                body: Center(
                  child: Text(
                    "WELCOME TO ECCOMERCE",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizes.FONT_SIZE_22),
                  ),
                ),
              ));

  }
}
