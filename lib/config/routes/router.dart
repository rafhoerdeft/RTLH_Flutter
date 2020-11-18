import 'package:get/get.dart';
import '../../config/routes/router_name.dart';
import '../../ui/page/main_page.dart';
import '../../ui/template.dart';
import '../../ui/login_page.dart';
import '../../ui/splash_page.dart';

//Router
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
