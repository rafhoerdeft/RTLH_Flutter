import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/routes/router_name.dart';
import '../service/auth_service.dart';
import '../widget/dialog_widget.dart';

class LoginController extends GetxController {
  final loading = false.obs;

  cekAuth(String user, String pass, BuildContext context) async {
    AuthService auth = AuthService();
    loading.value = true;
    await auth.signIn(user, pass).then((res) {
      (res)
          ? Get.offAllNamed(HomeRoute)
          : tampilToast(
              context, 'Sign In Failed!', Colors.red[900], Colors.white);
    });
    loading.value = false;
  }
}
