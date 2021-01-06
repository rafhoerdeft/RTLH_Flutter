import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class TemplateController extends GetxController {
  final page_active = 0.obs;
  final title = 'Dahsboard'.obs;
  PageController pageCtrl = PageController(initialPage: 0);

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
