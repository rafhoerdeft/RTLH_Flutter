import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RtlhController extends GetxController {
  final count1 = 0.obs;
  final count2 = 0.obs;

  increment1() => count1.value++;
  increment2() => count2.value++;

  int get sum => count1.value + count2.value;
}

class TabList {
  final Widget page;
  final String title;

  TabList({this.page, this.title});
}
