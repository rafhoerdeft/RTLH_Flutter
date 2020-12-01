// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:division/division.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:rtlh_app/controller/rtlh_controller.dart';
// import 'package:rtlh_app/widget/dialog_widget.dart';
import '../../../config/config.dart';
import '../../../controller/daftar_rtlh_controller.dart';
// import '../../../ui/style/dashboard_style.dart';

class DaftarRtlhPage extends StatefulWidget {
  @override
  _DaftarRtlhPageState createState() => _DaftarRtlhPageState();
}

class _DaftarRtlhPageState extends State<DaftarRtlhPage> {
  final DaftarRtlhController list = Get.put(DaftarRtlhController());

  @override
  Widget build(BuildContext context) {
    var txtCari = TextFormField(
      controller: list.ctrlCari,
      keyboardType: TextInputType.text,
      autofocus: false,
      onChanged: (val) {
        print(val);
      },
      style: TextStyle(color: pmColor, fontSize: getSizeH9(context)),
      // initialValue: 'Search ...',
      decoration: InputDecoration(
        focusColor: redColor,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Icon(
            Icons.search,
            size: getSizeH4(context),
            color: Colors.grey[400],
          ),
        ),
        // labelText: 'Search ...',
        hintText: 'Search ...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey[900],
            width: 0.2,
            style: BorderStyle.solid,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Data harus diisi!';
      //   }
      //   return null;
      // },
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 6,
                  child: txtCari,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Filter',
                    style: TextStyle(fontSize: getSizeH9(context)),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: MaterialButton(
                    padding: EdgeInsets.all(5),
                    onPressed: () {},
                    child: Icon(
                      Icons.filter_list,
                      color: redColor,
                      size: getSizeH3(context),
                    ),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Divider(
              thickness: 1,
              color: lightColor,
              height: 25,
            ),
            Obx(
              () => Expanded(
                child: SmartRefresher(
                    controller: list.refreshController,
                    enablePullDown: true,
                    enablePullUp: false,
                    onRefresh: () {
                      list.refreshData();
                    },
                    child: list.listUis.value),
              ),
            ),
          ],
        ),
        Obx(
          () => AnimatedOpacity(
            opacity: list.showButton.value ? 1.0 : 0.0,
            duration: Duration(milliseconds: 200),
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 80),
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 50,
                height: 50,
                child: MaterialButton(
                  padding: EdgeInsets.all(0),
                  elevation: 5,
                  color: redColor,
                  onPressed: () {
                    list.toTheTop();
                  },
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.arrow_circle_up,
                    size: 35,
                    color: lightColor,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
