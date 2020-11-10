import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_bloc/config/routes/router_name.dart';
import 'package:latihan_bloc/service/auth_service.dart';
import 'package:latihan_bloc/widget/dialog_widget.dart';

class LoginController extends GetxController {
  final loading = false.obs;

  cekAuth(String user, String pass, BuildContext context) async {
    AuthService auth = AuthService();
    loading.value = true;
    await auth.signIn(user, pass).then((res) {
      (res)
          ? Get.offAllNamed(HomeRoute)
          : tampilToast(context, 'Sign In Failed!', Colors.red[900]);
    });
    loading.value = false;
  }
}
