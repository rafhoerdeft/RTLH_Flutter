import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../controller/dashboard_controller.dart';
import '../../../controller/daftar_rtlh_upload_controller.dart';
import '../../../controller/daftar_rtlh_controller.dart';
import '../../../widget/dialog_widget.dart';
import '../../../config/api_config.dart';
import '../../../config/config.dart';
import '../../../controller/form_rtlh_controller.dart';

class FormUpdateRtlhPage extends StatefulWidget {
  @override
  _FormUpdateRtlhPageState createState() => _FormUpdateRtlhPageState();
}

class _FormUpdateRtlhPageState extends State<FormUpdateRtlhPage> {
  final FormRtlhController fup = Get.put(FormRtlhController());
  final DashboardController dash = Get.put(DashboardController());
  final DaftarRtlhController list = Get.put(DaftarRtlhController());
  final DaftarRtlhUploadController list_upload =
      Get.put(DaftarRtlhUploadController());

  InAppWebViewController webViewCtrl;

  final id_rtlh = Get.parameters['id'];
  final id_user = Get.parameters['id_user'];

  @override
  Widget build(BuildContext context) {
    var txtNik = TextFormField(
      controller: fup.nik_rtlh,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.credit_card),
        labelText: 'NIK',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtNama = TextFormField(
      controller: fup.nkk_rtlh,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Nama',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtAlamat = TextFormField(
      controller: fup.alamat_rtlh,
      keyboardType: TextInputType.text,
      maxLines: 3,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.home),
        labelText: 'Alamat',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var txtUmur = TextFormField(
      controller: fup.umur_rtlh,
      maxLength: 3,
      keyboardType: TextInputType.number,
      autofocus: false,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_add_alt_1),
        labelText: 'Umur',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Data harus diisi!';
        }
        return null;
      },
    );

    var selectJk = DropdownButtonFormField(items: null, onChanged: null);

    var btnSave = AnimatedButton(
      pressEvent: () {
        if (fup.formKey.currentState.validate()) {}
      },
      text: 'Simpan',
      width: double.infinity,
      color: redColor,
      icon: Icons.save,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    var formUpdate = Form(
      key: fup.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          txtNik,
          txtNama,

          SizedBox(height: 20),
          btnSave,
          // SizedBox(height: 10),
        ],
      ),
    );

    var webView = Obx(() => Stack(
          children: [
            InAppWebView(
              initialUrl:
                  api_rtlh + "/mobile/updateRtlh/" + id_rtlh + "/" + id_user,
              initialHeaders: requestHeader,
              onConsoleMessage:
                  (InAppWebViewController controller, ConsoleMessage alert) {
                // print(alert.message);
                if (alert.message == 'true') {
                  tampilToast(context, 'Update data berhasil', yellowColor,
                      Colors.white);
                  list.refreshData();
                  list_upload.refreshData();
                  dash.getInfo();
                  Get.back();
                }
                if (alert.message == 'false') {
                  tampilToast(
                      context, 'Update data gagal', redColor, Colors.white);
                }
              },
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                debuggingEnabled: true,
              )),
              onWebViewCreated: (InAppWebViewController controller) {
                webViewCtrl = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                fup.progres_bar.value = progress / 100;
              },
            ),
            Container(
              child: fup.progres_bar.value < 1.0
                  ? LinearProgressIndicator(
                      value: fup.progres_bar.value,
                      backgroundColor: Colors.redAccent[100],
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : Container(),
            ),
            Center(
              child: fup.progres_bar.value < 1.0
                  ? Container(
                      color: Colors.blueGrey.withOpacity(0.3),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SpinKitWave(
                        color: redColor,
                        size: 35.0,
                      ),
                    )
                  : Container(),
            ),
            // RaisedButton(
            //   child: Text('Post'),
            //   onPressed: () {
            //     webViewCtrl.evaluateJavascript(source: "alerts('dancuk');");
            //   },
            // )
          ],
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data RTLH'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              webViewCtrl.reload();
            },
          )
        ],
      ),
      body: webView,
    );
  }
}
