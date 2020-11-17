import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import '../shared/login_shared.dart';

class ProfilController extends GetxController {
  final nama_user = ''.obs;
  final pending = 120.obs;
  final upload = 200.obs;
  final version = '0'.obs;

  @override
  void onInit() {
    getNama();
    getVersion();
  }

  void getNama() async {
    await getNamaUser().then((value) {
      nama_user.value = value;
    });
  }

  void getVersion() async {
    try {
      version.value = await GetVersion.projectVersion;
    } on PlatformException {
      version.value = '0.0.0';
    }
  }
}
