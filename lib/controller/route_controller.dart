import 'package:get/get.dart';
import '../config/routes/router_name.dart';
import '../shared/login_shared.dart';

class RouteController extends GetxController {
  final route = LoginRoute.obs;

  cek_auth() async {
    await getStatus().then((val) {
      if (val) {
        route.value = HomeRoute;
      } else {
        route.value = LoginRoute;
      }
    });
  }
}
