import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
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
      style: TextStyle(color: pmColor),
      // initialValue: 'Search ...',
      decoration: InputDecoration(
        focusColor: redColor,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          size: getSizeH4(context),
          color: Colors.grey[400],
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
                  shape: StadiumBorder(),
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
                                ..borderRadius(all: 0)
                                ..margin(top: 10),
                              child: SizedBox(
                                width: getSizeH1(context),
                                child: MaterialButton(
                                  splashColor: pmColor,
                                  padding: EdgeInsets.all(5),
                                  color: yellowColor,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.edit,
                                    color: lightColor,
                                  ),
                                  height: getSizeH1(context),
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ),
                            Parent(
                              style: gridDashStyle.clone()
                                ..background.color(pmColor)
                                ..borderRadius(
                                    bottomLeft: 0,
                                    topLeft: 0,
                                    topRight: 10,
                                    bottomRight: 10)
                                ..offset(-1, 0)
                                ..margin(top: 10),
                              child: SizedBox(
                                width: getSizeH1(context),
                                child: MaterialButton(
                                  splashColor: pmColor,
                                  padding: EdgeInsets.all(5),
                                  color: redColor,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.cloud_upload,
                                    color: lightColor,
                                  ),
                                  height: getSizeH1(context),
                                  shape: StadiumBorder(),
                                ),
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
                              ..background.color(lightColor)
                              ..margin(top: 10),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "NIK : " + last.value.nik,
                                      style: TextStyle(
                                          fontSize: getSizeH7(context),
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
                                )
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
