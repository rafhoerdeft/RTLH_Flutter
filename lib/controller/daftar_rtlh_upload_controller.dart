import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../ui/style/all_style.dart';
import '../config/config.dart';
import '../ui/style/dashboard_style.dart';
import '../widget/dialog_widget.dart';
import '../shared/login_shared.dart';
import '../model/daftar_rtlh_model.dart';
import '../service/rtlh_service.dart';

class DaftarRtlhUploadController extends GetxController {
  final daftar_rtlh = [].obs;
  final isLoading = false.obs;
  static Widget _listUi;
  final listUis = _listUi.obs;
  final showButton = false.obs;
  final valCari = ''.obs;

  final formKey = GlobalKey<FormState>();
  TextEditingController ctrlCari = TextEditingController();
  ScrollController scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    // daftarRtlh();
    showListUi();
    getMoreData(daftar_rtlh.value.length);

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 25)) {
        if (ctrlCari.text == '' || ctrlCari.text == null) {
          getMoreData(daftar_rtlh.value.length);
        }
      }

      if (scrollController.position.pixels >= 150) {
        showButton.value = true;
      } else {
        showButton.value = false;
      }

      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showButton.value = false;
      }
    });
  }

  void changeValCari(String val) {
    valCari.value = val;
  }

  Widget buildProgressIndicator() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 85),
        child: Center(
          child: Opacity(
            opacity: isLoading.value ? 1.0 : 00,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  void showListUi() {
    listUis.value = GridView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: daftar_rtlh.value.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.8,
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          if (index == daftar_rtlh.value.length) {
            return buildProgressIndicator();
          } else {
            dynamic last = daftar_rtlh.value[index];
            return Card(
              child: LayoutBuilder(
                builder: (context, constraint) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Parent(
                        style: boxStyle.clone()
                          ..borderRadius(topLeft: 5, topRight: 5)
                          ..padding(all: 0)
                          ..background.image(
                              url:
                                  'https://pemerintahan.memontum.com/wp-content/uploads/sites/5/2019/07/Ungkap-Permainan-Dana-RTLH-DPRD-Bondowoso-Bentuk-Pansus.jpg',
                              alignment: Alignment.topCenter,
                              fit: BoxFit.fitHeight),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(last.nik),
                                Text(last.nama),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                      ),
                                    ),
                                    elevation: 0,
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: lightColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: yellowColor,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                    elevation: 0,
                                    child: Text(
                                      'Upload',
                                      style: TextStyle(
                                          color: lightColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: redColor,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }

  void daftarRtlh() {
    daftar_rtlh.value = [
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
    ];
  }

  void getMoreData(int offset) async {
    if (!isLoading.value) {
      int limit = 10;
      isLoading.value = true;

      RtlhService rtlh = RtlhService();
      await getKodeWil().then((value) async {
        dynamic res = await rtlh.listRtlh(value, limit, offset);

        if (res != false) {
          for (final data in res) {
            // print(data['id']);
            daftar_rtlh.value.add(DaftarRtlh(
                nik: data['nik_rtlh'], nama: data['nkk_rtlh'], id: data['id']));
          }
          showListUi();
        }
        isLoading.value = false;
      });
    }
  }

  void searchData(String search) async {
    if (!isLoading.value) {
      isLoading.value = true;

      RtlhService rtlh = RtlhService();
      await getKodeWil().then((value) async {
        int limit = 10;
        // daftar_rtlh.value = [];
        dynamic res = await rtlh.searchRtlh(value, search, limit);

        if (res != false) {
          for (final data in res) {
            daftar_rtlh.value.add(DaftarRtlh(
                nik: data['nik_rtlh'], nama: data['nkk_rtlh'], id: data['id']));
          }
        }

        isLoading.value = false;
        showListUi();
      });
    }
  }

  void refreshData() async {
    daftar_rtlh.value = [];
    if (ctrlCari.text != '' || ctrlCari.text != null) {
      await searchData(ctrlCari.text);
    } else {
      await getMoreData(daftar_rtlh.value.length);
    }
    refreshController.refreshCompleted();
  }

  void toTheTop() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
