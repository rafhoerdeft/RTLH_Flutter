import 'package:get/get.dart';
import 'package:latihan_bloc/config/routes/router_name.dart';
import 'package:latihan_bloc/shared/login_shared.dart';

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
