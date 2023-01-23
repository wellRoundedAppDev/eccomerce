import 'package:ecommerce_flogics/apis/products_apis.dart';
import 'package:ecommerce_flogics/providers/auth_provider.dart';
import 'package:ecommerce_flogics/providers/cart_provider.dart';
import 'package:ecommerce_flogics/providers/products_provider.dart';
import 'package:ecommerce_flogics/providers/user_provider.dart';
import 'package:ecommerce_flogics/screens/cart_screen.dart';
import 'package:ecommerce_flogics/screens/products_screen.dart';
import 'package:ecommerce_flogics/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';
import '../shared_widgets/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: CustomNavigationBar(),
            body: Consumer<NavigationProvider>(
                builder: (context, navService, child) {
                  if(navService.selectedHomeScreenTab == 2){
                    context.read<ProductsProvider>().getAllProducts();
                  }else if(navService.selectedHomeScreenTab == 1) {
                    context.read<UserProvider>().getUserProfile();
                  }else if(navService.selectedHomeScreenTab == 0){
                  }
              return Center(
                  child: (navService.selectedHomeScreenTab == 2)
                      ? ProductsScreen()
                      : (navService.selectedHomeScreenTab == 1)
                          ? ProfileScreen()
                          : CartScreen());
            })));
  }
}
