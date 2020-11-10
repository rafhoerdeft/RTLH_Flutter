import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/routes/router_name.dart';
import '../../ui/home_page.dart';
import '../../ui/page/main_page.dart';
import '../../ui/template.dart';
import '../../ui/login_page.dart';
import '../../ui/splash_page.dart';

//Router
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashRoute:
      return MaterialPageRoute(builder: (BuildContext context) => SplashPage());
    case LoginRoute:
      return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
    case HomeRoute:
      return MaterialPageRoute(builder: (BuildContext context) => HomePage());
    default:
      return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
  }
}

dynamic router = [
  GetPage(
      name: SplashRoute,
      page: () => SplashPage(),
      transition: Transition.leftToRight),
  GetPage(
      name: MainRoute,
      page: () => MainPage(),
      transition: Transition.cupertino),
  GetPage(
      name: HomeRoute,
      page: () => TemplatePage(),
      transition: Transition.cupertino),
  GetPage(
      name: LoginRoute, page: () => LoginPage(), transition: Transition.zoom),
];
