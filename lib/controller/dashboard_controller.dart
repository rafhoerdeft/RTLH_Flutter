import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_bloc/shared/login_shared.dart';

class DashboardController extends GetxController {
  final nama_user = ''.obs;

  @override
  void onInit() {
    getNama();
  }

  void getNama() async {
    await getNamaUser().then((value) {
      nama_user.value = value;
    });
  }
}

class GridList {
  final dynamic icon;
  final String count;
  final String title;

  GridList({this.count, this.icon, this.title});
}
