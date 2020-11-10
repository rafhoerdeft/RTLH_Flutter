import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplateController extends GetxController {
  int page_active = 0;
  final title = 'Dahsboard'.obs;
  PageController pageCtrl = PageController(initialPage: 0);

  changePage(val, ttl) {
    page_active = val;
    // pageCtrl.animateToPage(
    //   val,
    //   duration: Duration(milliseconds: 500),
    //   curve: Curves.ease,
    // );
    // print(page_active);
    pageCtrl.jumpToPage(page_active);
    update();
    title.value = ttl;
  }
}

class PagesList {
  final Widget page;
  final dynamic icon;
  final String title;

  PagesList({this.page, this.icon, this.title});
}
