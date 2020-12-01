import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../config/config.dart';
import '../ui/style/dashboard_style.dart';
import '../widget/dialog_widget.dart';
import '../shared/login_shared.dart';
import '../model/daftar_rtlh_model.dart';
import '../service/rtlh_service.dart';

class DaftarRtlhController extends GetxController {
  final daftar_rtlh = [].obs;
  final isLoading = false.obs;
  static Widget _listUi;
  final listUis = _listUi.obs;
  final showButton = false.obs;

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
        getMoreData(daftar_rtlh.value.length);
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

  Widget _buildProgressIndicator() {
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
    listUis.value = ListView.builder(
      controller: scrollController,
      itemCount: daftar_rtlh.value.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == daftar_rtlh.value.length) {
          return _buildProgressIndicator();
        } else {
          dynamic last = daftar_rtlh.value[index];

          return Slidable(
            key: ValueKey(index),
            actionPane: SlidableDrawerActionPane(),
            secondaryActions: <Widget>[
              Parent(
                style: gridDashStyle.clone()
                  ..background.color(pmColor)
                  ..padding(all: 10)
                  ..borderRadius(
                      bottomLeft: 10, topLeft: 10, topRight: 0, bottomRight: 0)
                  ..margin(top: 10),
                child: MaterialButton(
                  splashColor: pmColor,
                  padding: EdgeInsets.all(5),
                  color: yellowColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.edit,
                    color: lightColor,
                    size: getSizeH7(context),
                  ),
                  height: getSizeH1(context) + 20,
                  shape: CircleBorder(),
                ),
              ),
              Parent(
                style: gridDashStyle.clone()
                  ..background.color(pmColor)
                  ..padding(all: 10)
                  ..borderRadius(
                      bottomLeft: 0, topLeft: 0, topRight: 10, bottomRight: 10)
                  ..offset(-1, 0)
                  ..margin(top: 10),
                child: MaterialButton(
                  splashColor: pmColor,
                  padding: EdgeInsets.all(5),
                  color: redColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.cloud_upload,
                    color: lightColor,
                    size: getSizeH7(context),
                  ),
                  height: getSizeH1(context) + 20,
                  shape: CircleBorder(),
                ),
              ),
            ],
            // dismissal: SlidableDismissal(
            //   child: SlidableDrawerDismissal(),
            //   closeOnCanceled: false,
            //   onWillDismiss: (dynamic) {},
            // ),
            direction: Axis.horizontal,
            child: Parent(
              style: gridDashStyle.clone()
                ..padding(all: 15)
                ..background.color(lightColor)
                ..margin(top: 10),
              gesture: Gestures()
                ..onTap(() {
                  tampilFlushBar(
                      context, 'Geser ke kiri untuk tombol operasi', scColor);
                }),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: getSizeH1(context),
                    color: redColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "NIK : " + last.nik,
                          style: TextStyle(
                              fontSize: getSizeH9(context),
                              fontWeight: FontWeight.bold,
                              color: pmColor),
                        ),
                        Text(
                          "Nama : " + last.nama,
                          style: TextStyle(
                            fontSize: getSizeH9(context),
                            fontWeight: FontWeight.bold,
                            color: pmColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    size: getSizeH9(context),
                    color: scColor,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  void daftarRtlh() {
    daftar_rtlh.value = [
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
      DaftarRtlh(
        nik: '3308072505520002',
        nama: 'Rafho Caem',
      ),
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

        for (final data in res) {
          // print(data['id']);
          daftar_rtlh.value.add(DaftarRtlh(
              nik: data['nik_rtlh'], nama: data['nkk_rtlh'], id: data['id']));
        }
        isLoading.value = false;
        showListUi();
        // });
      });
    }
  }

  void refreshData() async {
    daftar_rtlh.value = [];
    await getMoreData(daftar_rtlh.value.length);
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
