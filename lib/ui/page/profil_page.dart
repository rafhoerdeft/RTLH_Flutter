import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/login_shared.dart';
import '../../controller/profil_controller.dart';
import '../../ui/style/all_style.dart';
import '../../config/config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final ProfilController prof = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 85),
        children: [
          Parent(
            style: boxStyle.clone()
              ..borderRadius(all: 20)
              ..elevation(4, opacity: 0.8),
            child: Column(
              children: [
                Hero(
                  tag: 'iconPP',
                  child: Icon(
                    Icons.account_circle,
                    size: getSizeH1(context) + 50,
                    color: lightColor,
                  ),
                ),
                Txt(
                  prof.nama_user.value,
                  style: txtStyle.clone()..fontSize(getSizeH5(context)),
                ),
                SizedBox(height: 10),
                Parent(
                  style: boxStyle.clone()
                    ..background.color(redColor)
                    ..padding(all: 10),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Txt(
                              'Pending',
                              style: txtStyle.clone()
                                ..fontSize(getSizeH7(context)),
                            ),
                            Txt(
                              prof.pending.value.toString(),
                              style: txtStyle.clone()
                                ..fontSize(getSizeH7(context)),
                            )
                          ],
                        ),
                        VerticalDivider(
                          color: lightColor,
                          thickness: 1,
                        ),
                        Column(
                          children: [
                            Txt(
                              'Upload',
                              style: txtStyle.clone()
                                ..fontSize(getSizeH7(context)),
                            ),
                            Txt(
                              prof.upload.value.toString(),
                              style: txtStyle.clone()
                                ..fontSize(getSizeH7(context)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Txt(
            'Pengaturan Aplikasi',
            style: txtStyle.clone()
              ..textAlign.left()
              ..textColor(pmColor)
              ..fontSize(getSizeH7(context)),
          ),
          SizedBox(
            height: 20,
          ),
          Parent(
            style: boxStyle.clone()
              ..background.color(lightColor)
              ..margin(bottom: 10),
            child: Txt(
              'Edit Profil',
              style: txtStyle.clone()
                ..textAlign.left()
                ..textColor(pmColor)
                ..fontSize(getSizeH9(context)),
            ),
          ),
          Parent(
            style: boxStyle.clone()
              ..background.color(lightColor)
              ..margin(bottom: 10),
            child: Txt(
              'Tentang Aplikasi',
              style: txtStyle.clone()
                ..textAlign.left()
                ..textColor(pmColor)
                ..fontSize(getSizeH9(context)),
            ),
          ),
          Parent(
            style: boxStyle.clone()
              ..background.color(lightColor)
              ..margin(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  'Versi',
                  style: txtStyle.clone()
                    ..textAlign.left()
                    ..textColor(pmColor)
                    ..fontSize(getSizeH9(context)),
                ),
                (prof.version.value != '0')
                    ? Txt(
                        prof.version.value,
                        style: txtStyle.clone()
                          ..textAlign.right()
                          ..textColor(pmColor)
                          ..fontSize(getSizeH9(context)),
                      )
                    : SpinKitHourGlass(
                        color: pmColor,
                        size: getSizeH7(context),
                      ),
              ],
            ),
          ),
          Parent(
            style: boxStyle.clone()
              ..background.color(lightColor)
              ..padding(all: 0)
              ..margin(bottom: 10),
            child: MaterialButton(
              padding: EdgeInsets.all(15),
              onPressed: () {
                // print('Logout');
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  headerAnimationLoop: false,
                  animType: AnimType.TOPSLIDE,
                  title: 'Logout',
                  desc: 'Apakah anda yakin akan logout?',
                  btnCancelIcon: Icons.cancel,
                  btnCancelText: 'Batal',
                  btnCancelOnPress: () {},
                  btnOkIcon: Icons.check_circle,
                  btnOkText: 'Ya',
                  btnOkOnPress: () {
                    logout();
                  },
                )..show();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Txt(
                    'Logout',
                    style: txtStyle.clone()
                      ..textAlign.left()
                      ..textColor(pmColor)
                      ..fontSize(getSizeH9(context)),
                  ),
                  Icon(
                    Icons.logout,
                    size: getSizeH7(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
