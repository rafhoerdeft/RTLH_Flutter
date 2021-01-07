import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:division/division.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:rtlh_app/widget/dialog_widget.dart';
import '../../shared/login_shared.dart';
import '../../controller/profil_controller.dart';
import '../../ui/style/all_style.dart';
import '../../config/config.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final ProfilController prof = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    var txtNama = TextFormField(
      controller: prof.ctrlNama,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Nama User',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtNoHp = TextFormField(
      controller: prof.ctrlNoHp,
      maxLength: 15,
      keyboardType: TextInputType.number,
      autofocus: false,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.contact_phone),
        labelText: 'Nomor HP',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtUser = TextFormField(
      controller: prof.ctrlUser,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        labelText: 'Username',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtPass = TextFormField(
      controller: prof.ctrlPass,
      keyboardType: TextInputType.text,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: 'Password',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        } else if (value.length < 6) {
          return "Password harus minimal 6 karakter";
        } else {
          return null;
        }
      },
    );

    var txtConfPass = TextFormField(
      controller: prof.ctrlConfPass,
      keyboardType: TextInputType.text,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: 'Konfirmasi Password',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        } else {
          if (prof.ctrlPass.text != value) {
            return 'Password tidak sama!';
          }
        }
        return null;
      },
    );

    var btnSave = AnimatedButton(
      pressEvent: () async {
        if (prof.formKey.currentState.validate()) {
          bool res = await prof.simpanProfil();
          if (res) {
            tampilToast(context, 'Berhasil simpan profil', scColor, lightColor);
          } else {
            tampilToast(context, 'Gagal simpan profil', redColor, lightColor);
          }
        }
      },
      text: 'Simpan',
      width: double.infinity,
      color: redColor,
      icon: Icons.save,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    var formProfil = Form(
      key: prof.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          txtNama,
          txtNoHp,
          txtUser,
          txtPass,
          txtConfPass,
          SizedBox(height: 20),
          btnSave,
          // SizedBox(height: 10),
        ],
      ),
    );

    return Obx(
      () => SafeArea(
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
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
                          size: getSizeH1() + 50,
                          color: lightColor,
                        ),
                      ),
                      Txt(
                        prof.nama_user.value,
                        style: txtStyle.clone()..fontSize(getSizeH6()),
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
                              Expanded(
                                child: Column(
                                  children: [
                                    Txt(
                                      'Diupdate',
                                      style: txtStyle.clone()
                                        ..fontSize(getSizeH8()),
                                    ),
                                    Txt(
                                      prof.diupdate.value,
                                      style: txtStyle.clone()
                                        ..fontSize(getSizeH8()),
                                    )
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                color: lightColor,
                                thickness: 1,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Txt(
                                      'Diupload',
                                      style: txtStyle.clone()
                                        ..fontSize(getSizeH8()),
                                    ),
                                    Txt(
                                      prof.diupload.value,
                                      style: txtStyle.clone()
                                        ..fontSize(getSizeH8()),
                                    )
                                  ],
                                ),
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
                    ..fontSize(getSizeH8()),
                ),
                SizedBox(
                  height: 20,
                ),
                Parent(
                  style: boxStyle.clone()
                    ..padding(left: 6, top: 6, bottom: 4, right: 6)
                    ..background.color(lightColor)
                    ..margin(bottom: 10),
                  child: ExpandablePanel(
                    header: Txt(
                      'Edit Profil',
                      style: txtStyle.clone()
                        ..padding(all: 10)
                        ..textAlign.left()
                        ..textColor(pmColor)
                        ..fontSize(getSizeH9()),
                    ),
                    expanded: Column(
                      children: [
                        Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: formProfil,
                        ),
                      ],
                    ),
                  ),
                ),
                Parent(
                  style: boxStyle.clone()
                    ..padding(left: 6, top: 6, bottom: 4, right: 6)
                    ..background.color(lightColor)
                    ..margin(bottom: 10),
                  child: ExpandablePanel(
                    header: Txt(
                      'Tentang Aplikasi',
                      style: txtStyle.clone()
                        ..padding(all: 10)
                        ..textAlign.left()
                        ..textColor(pmColor)
                        ..fontSize(getSizeH9()),
                    ),
                    expanded: Column(
                      children: [
                        Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Aplikasi ini dibuat oleh DISKOMINFO Kab. Magelang. Fungsi aplikasi ini adalah untuk mempermudah para petugas fasilitator RTLH melakukan verifikasi data di lapangan.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: getSizeH9()),
                          ),
                        ),
                      ],
                    ),
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
                          ..fontSize(getSizeH9()),
                      ),
                      Txt(
                        prof.version.value,
                        style: txtStyle.clone()
                          ..textAlign.right()
                          ..textColor(pmColor)
                          ..fontSize(getSizeH9()),
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
                            ..fontSize(getSizeH9()),
                        ),
                        Icon(
                          Icons.logout,
                          size: getSizeH7(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            (prof.isLoadingUpdate.value)
                ? Container(
                    color: Colors.blueGrey.withOpacity(0.3),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SpinKitWave(
                      color: redColor,
                      size: 35.0,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
