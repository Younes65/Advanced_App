


import 'package:advanced_app/presentation/forgotten_password/forgotten_password.dart';
import 'package:advanced_app/presentation/login_screen/login_screen.dart';
import 'package:advanced_app/presentation/onBoarding_screen/onBoarding_screen.dart';
import 'package:advanced_app/presentation/register_screen/register_screen.dart';
import 'package:advanced_app/presentation/resources/strings_manager.dart';
import 'package:advanced_app/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_screen/main_screen.dart';
import '../store_details_screan/store_details_screen.dart';

class RouteManager{

  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding_screen";
  static const String loginRoute = "/login_screen";
  static const String registerRoute = "/register_screen";
  static const String forgottenPasswordRoute = "/forgotten_Password";
  static const String storeDetailsRoute = "/store_Details";
  static const String mainRoute = "/main_screen";


}


class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings Settings ){
    switch(Settings.name ){
      case RouteManager.splashRoute : 
        return MaterialPageRoute(builder: (_)=>SplashScreen());
      case RouteManager.onBoardingRoute :
        return MaterialPageRoute(builder: (_)=>OnBoardingScreen());
      case RouteManager.loginRoute :
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      case RouteManager.registerRoute :
        return MaterialPageRoute(builder: (_)=>RegisterScreen());
      case RouteManager.forgottenPasswordRoute :
        return MaterialPageRoute(builder: (_)=>ForgottenPassword());
      case RouteManager.mainRoute :
        return MaterialPageRoute(builder: (_)=>MainScreen());
      case RouteManager.storeDetailsRoute :
        return MaterialPageRoute(builder: (_)=>StoreDetailsScreen());

      default: return undefinedPage();
    }

  }

  static Route<dynamic> undefinedPage() {
    return MaterialPageRoute(builder: (_)=>
        Scaffold(
          appBar: AppBar(title: Text(AppStrings.noPageFounded), // todo add it to file string manager
          ),
          body: Center(child: Text(AppStrings.noPageFounded)), // todo add it to file string manager
        ),
        );

  }


}