import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/grid_list_model.dart';
import '../model/last_update_model.dart';
import '../shared/login_shared.dart';
import '../widget/Icons/rtlh_icon_icons.dart';

class DashboardController extends GetxController {
  final nama_user = ''.obs;
  // final grid_list = GridList().obs;
  final list_grid = [].obs;
  final last_update = [].obs;

  @override
  void onInit() {
    getNama();
    listGrid(
      countRtlh: 1000,
      countProses: 2000,
      countTerima: 2000,
      countTolak: 2000,
    );
    lastUpdate();
  }

  void getNama() async {
    await getNamaUser().then((value) {
      nama_user.value = value;
    });
  }

  void listGrid(
      {int countRtlh, int countTerima, int countTolak, int countProses}) {
    list_grid.value = [
      GridList(
        icon: RtlhIcon.logo_rtlh,
        title: 'RTLH',
        count: countRtlh.toString(),
      ),
      GridList(
        icon: Icons.verified,
        title: 'Diterima',
        count: countTerima.toString(),
      ),
      GridList(
        icon: Icons.cancel_outlined,
        title: 'Ditolak',
        count: countTolak.toString(),
      ),
      GridList(
        icon: Icons.settings,
        title: 'Diproses',
        count: countProses.toString(),
      ),
    ];
  }

  void lastUpdate() {
    last_update.value = [
      LastUpdate(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      LastUpdate(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      LastUpdate(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      LastUpdate(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
    ];
  }
}
