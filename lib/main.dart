import 'package:ecommerce_flogics/constants/paths/route_paths.dart';
import 'package:ecommerce_flogics/providers/auth_provider.dart';
import 'package:ecommerce_flogics/providers/navigation_provider.dart';
import 'package:ecommerce_flogics/providers/products_provider.dart';
import 'package:ecommerce_flogics/screens/home_screen.dart';
import 'package:ecommerce_flogics/screens/login_screen.dart';
import 'package:ecommerce_flogics/screens/product_details_screen.dart';
import 'package:ecommerce_flogics/screens/products_screen.dart';
import 'package:ecommerce_flogics/screens/profile_screen.dart';
import 'package:ecommerce_flogics/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          RoutePaths.SPLASH_SCREEN_ROUTE_ID: (context) => SplashScreen(),
          RoutePaths.LOGIN_SCREEN_ROUTE_ID: (context) => LoginScreen(),
          RoutePaths.HOME_SCREEN_ROUTE_ID: (context) => HomeScreen(),
          RoutePaths.PROFILE_SCREEN_ROUTE_ID: (context) => ProfileScreen(),
          RoutePaths.PRODUCTS_SCREEN_ROUTE_ID: (context) => ProductsScreen(),
          RoutePaths.PRODUCT_DETAILS_SCREEN_ROUTE_ID: (context) => ProductDetailsScreen()

        },
        home: SplashScreen(),
      ),
    );
  }
}
