import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/dash_service.dart';
import '../model/grid_list_model.dart';
import '../model/last_update_model.dart';
import '../shared/login_shared.dart';
import '../widget/Icons/rtlh_icon_icons.dart';

class DashboardController extends GetxController {
  final nama_user = ''.obs;
  final nama_desa = ''.obs;
  final nama_kec = ''.obs;
  final list_grid = [].obs;
  final last_update = [].obs;
  final loading_last_update = false.obs;
  final syncs = false.obs;
  final id_user = ''.obs;

  @override
  void onInit() async {
    await getIds();
    await getInfo();
  }

  void getIds() async {
    id_user.value = await getIdUser();
  }

  void getNama() async {
    nama_user.value = await getNamaUser();
  }

  void getInfo() async {
    nama_user.value = await getNamaUser();

    nama_desa.value = await getDesa();

    nama_kec.value = await getKecamatan();

    getInfoDash();
    getLastUpdate();
  }

  void getInfoDash() async {
    listGrid(
      countRtlh: 'x',
      countTerima: 'x',
    );

    DashService dash = DashService();
    await getKodeWil().then((value) async {
      await dash.infoDash(value).then((res) {
        if (res != false) {
          listGrid(
            countRtlh: res['jml_rtlh'].toString(),
            countTerima: res['jml_upload'].toString(),
          );
        }
      });
    });
  }

  void getLastUpdate() async {
    lastUpdateLoading();
    loading_last_update.value = true;
    DashService dash = DashService();
    await getKodeWil().then((value) async {
      dynamic res = await dash.lastUpdate(value, id_user.value);
      // print(dataLast);
      // await dash.lastUpdate(value).then((res) {
      last_update.value = [];
      if (res != false) {
        for (final data in res) {
          // print(data['nik_rtlh']);
          last_update.value
              .add(LastUpdate(nik: data['nik_rtlh'], nama: data['nkk_rtlh']));
        }
      }

      loading_last_update.value = false;
      // update();
      // });
    });
  }

  void getSyncs() async {
    syncs.value = true;
    getInfoDash();
    await getLastUpdate();
    syncs.value = false;
  }

  void listGrid(
      {String countRtlh,
      String countTerima,
      String countTolak,
      String countProses}) {
    list_grid.value = [
      GridList(
        icon: RtlhIcon.logo_rtlh,
        title: 'RTLH',
        count: countRtlh,
      ),
      GridList(
        icon: Icons.verified,
        title: 'Upload',
        count: countTerima,
      ),
      // GridList(
      //   icon: Icons.cancel_outlined,
      //   title: 'Ditolak',
      //   count: countTolak,
      // ),
      // GridList(
      //   icon: Icons.settings,
      //   title: 'Diproses',
      //   count: countProses,
      // ),
    ];
  }

  void lastUpdateLoading() {
    last_update.value = [1, 2, 3, 4, 5];
  }
}
