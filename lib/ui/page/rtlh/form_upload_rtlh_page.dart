import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
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
  final DaftarRtlhUploadController list = Get.put(DaftarRtlhUploadController());

  InAppWebViewController webViewCtrl;

  final id_rtlh = Get.parameters['id'];

  @override
  Widget build(BuildContext context) {
    var webView = Obx(() => Stack(
          children: [
            InAppWebView(
              initialUrl: api_rtlh + "/mobile/uploadRtlh/" + id_rtlh,
              initialHeaders: requestHeader,
              onConsoleMessage:
                  (InAppWebViewController controller, ConsoleMessage alert) {
                // print(alert.message);
                if (alert.message == 'true') {
                  tampilToast(context, 'Update data berhasil', yellowColor,
                      Colors.white);
                  list.refreshData();
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
                if (fup.progres_bar.value >= 1.0) {
                  fup.getPosition();
                }
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
                  ? CircularProgressIndicator(
                      // value: fup.progres_bar.value,
                      backgroundColor: Colors.redAccent[100],
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : Container(),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    elevation: 5,
                    disabledColor: scColor,
                    color: redColor,
                    onPressed: fup.progres_bar.value < 1.0
                        ? null
                        : () async {
                            await fup.getPosition();
                          },
                    shape: StadiumBorder(),
                    child: Icon(
                      Icons.my_location,
                      size: 30,
                      color: lightColor,
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
