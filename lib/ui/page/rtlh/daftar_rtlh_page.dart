import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:rtlh_app/widget/dialog_widget.dart';
import '../../../config/config.dart';
import '../../../controller/daftar_rtlh_controller.dart';
import '../../../ui/style/dashboard_style.dart';

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
      child: Column(
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
          Expanded(
            child: ListView(
              children: [
                Obx(
                  () => Column(
                    children: list.daftar_rtlh.value.asMap().entries.map(
                      (last) {
                        return Slidable(
                          key: ValueKey(last.key),
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: <Widget>[
                            Parent(
                              style: gridDashStyle.clone()
                                ..background.color(pmColor)
                                ..padding(all: 10)
                                ..borderRadius(
                                    bottomLeft: 10,
                                    topLeft: 10,
                                    topRight: 0,
                                    bottomRight: 0)
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
                                    bottomLeft: 0,
                                    topLeft: 0,
                                    topRight: 10,
                                    bottomRight: 10)
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
                                    context,
                                    'Geser ke kiri untuk tombol operasi',
                                    scColor);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "NIK : " + last.value.nik,
                                        style: TextStyle(
                                            fontSize: getSizeH8(context),
                                            fontWeight: FontWeight.bold,
                                            color: pmColor),
                                      ),
                                      Text(
                                        "Nama : " + last.value.nama,
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
                      },
                    ).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
