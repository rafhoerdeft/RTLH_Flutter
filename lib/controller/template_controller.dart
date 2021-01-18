import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rtlh_app/service/version_service.dart';
import '../widget/dialog_widget.dart';

class TemplateController extends GetxController {
  final page_active = 0.obs;
  final title = 'Dahsboard'.obs;
  final verApp = '0'.obs;
  final verCek = '0'.obs;
  final linkUpdate = ''.obs;

  PageController pageCtrl = PageController(initialPage: 0);

  // @override
  // void onInit() async {
  //   await getVerApp();
  //   await getVerCek();
  // }

  changePage(val, ttl) {
    page_active.value = val;
    // pageCtrl.animateToPage(
    //   val,
    //   duration: Duration(milliseconds: 500),
    //   curve: Curves.ease,
    // );
    // print(page_active);
    pageCtrl.jumpToPage(page_active.value);
    update();
    title.value = ttl;
  }

  permissionAccessHardware() async {
    //Camera permission
    await Permission.camera.request();
    //GPS permission
    await Permission.location.request();

    // dynamic isGps = await Geolocator.isLocationServiceEnabled();

    // if (!isGps) {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // }
  }

  checkConnectInternet(context) async {
    var flush = tampilFlushBarErr('Tidak ada koneksi internet!');

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      flush.show(context);
    }

    Connectivity().onConnectivityChanged.listen((res) async {
      if (res == ConnectivityResult.none) {
        flush.show(context);
      } else {
        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            flush.dismiss(true);
          } else {
            flush.show(context);
          }
        } on SocketException catch (_) {
          flush.show(context);
        }
      }
    });
  }

  void getVerApp() async {
    try {
      verApp.value = await GetVersion.projectCode;
    } on PlatformException {
      verApp.value = '1';
    }
  }

  void getVerCek() async {
    VersionService ver = VersionService();
    await ver.cekVersion().then((res) {
      if (res != false) {
        verCek.value = res['code_ver'];
        linkUpdate.value = res['link_update_ver'];
      }
    });
  }

  checkUpdateApp(BuildContext context) async {
    await getVerApp();
    await getVerCek();
    int verAppConv = int.parse(verApp.value);
    int verCekConv = int.parse(verCek.value);
    if (verAppConv < verCekConv) {
      tampilAlertUpdate(context, linkUpdate.value);
    }
  }
}

class PagesList {
  final Widget page;
  final dynamic icon;
  final String title;
  final dynamic color;
  final double sizeIcon;

  PagesList({this.page, this.icon, this.title, this.color, this.sizeIcon});
}
