import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import '../controller/dashboard_controller.dart';
import '../service/profil_service.dart';
import '../shared/login_shared.dart';

class ProfilController extends GetxController {
  final nama_user = '...'.obs;
  final diupdate = '0'.obs;
  final diupload = '0'.obs;
  final version = '...'.obs;
  final id_user = ''.obs;
  final isLoadingUpdate = false.obs;

  final formKey = GlobalKey<FormState>();
  TextEditingController ctrlNama = TextEditingController();
  TextEditingController ctrlUser = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();
  TextEditingController ctrlConfPass = TextEditingController();
  TextEditingController ctrlNoHp = TextEditingController();

  final DashboardController dash = Get.put(DashboardController());

  @override
  void onInit() async {
    getNama();
    getVersion();
    showProfil();
    await getIds();
    await getInfo();
  }

  void getIds() async {
    id_user.value = await getIdUser();
  }

  void showProfil() async {
    ctrlNama.text = await getNamaUser();
    ctrlUser.text = await getUsername();
    ctrlNoHp.text = await getTelp();
  }

  void getInfo() async {
    ProfilService prof = ProfilService();
    await getKodeWil().then((value) async {
      await prof.infoDash(value, id_user.value).then((res) {
        if (res != false) {
          diupdate.value = res['jml_update'].toString();
          diupload.value = res['jml_upload'].toString();
        }
      });
    });
  }

  Future<dynamic> simpanProfil() async {
    isLoadingUpdate.value = true;
    ProfilService prof = ProfilService();
    bool respon = await prof.updateProfil(
        id_user: id_user.value,
        nama_user: ctrlNama.text,
        username: ctrlUser.text,
        no_hp: ctrlNoHp.text,
        password: ctrlPass.text);
    if (respon) {
      getNama();
      showProfil();
      dash.getNama();
    }
    isLoadingUpdate.value = false;
    return respon;
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
