import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../controller/dashboard_controller.dart';
import '../../../controller/daftar_rtlh_controller.dart';
import '../../../config/api_config.dart';
import '../../../config/config.dart';
import '../../../controller/daftar_rtlh_upload_controller.dart';
import '../../../controller/form_rtlh_controller.dart';
import '../../../widget/dialog_widget.dart';

class FormUploadRtlhPage extends StatefulWidget {
  @override
  _FormUploadRtlhPageState createState() => _FormUploadRtlhPageState();
}

class _FormUploadRtlhPageState extends State<FormUploadRtlhPage> {
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
    var webView = Obx(() => Stack(
          children: [
            InAppWebView(
              initialUrl:
                  api_rtlh + "/mobile/uploadRtlh/" + id_rtlh + "/" + id_user,
              initialHeaders: requestHeader,
              onConsoleMessage: (InAppWebViewController controller,
                  ConsoleMessage alert) async {
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
                if (alert.message == 'get') {
                  await fup.getPosition();
                  webViewCtrl.evaluateJavascript(
                      source: "nowLocation(" +
                          fup.latitude.value.toString() +
                          "," +
                          fup.longitude.value.toString() +
                          ")");
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
                  (InAppWebViewController controller, int progress) async {
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
              child: (fup.progres_bar.value < 1.0) || (fup.loadingPos.value)
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
            Obx(
              () => AnimatedOpacity(
                opacity: fup.progres_bar.value < 1.0 ? 0.0 : 1.0,
                duration: Duration(milliseconds: 200),
                child: Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      elevation: 5,
                      color: redColor,
                      onPressed: () async {
                        await fup.getPosition();
                        webViewCtrl.evaluateJavascript(
                            source: "nowLocation(" +
                                fup.latitude.value.toString() +
                                "," +
                                fup.longitude.value.toString() +
                                ")");
                      },
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.my_location,
                        size: 35,
                        color: lightColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Data RTLH'),
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
