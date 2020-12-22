import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../config/config.dart';
import '../../../controller/daftar_rtlh_upload_controller.dart';
import '../../../ui/style/all_style.dart';

class PendingRtlhPage extends StatefulWidget {
  @override
  _PendingRtlhPageState createState() => _PendingRtlhPageState();
}

class _PendingRtlhPageState extends State<PendingRtlhPage> {
  final DaftarRtlhUploadController list = Get.put(DaftarRtlhUploadController());

  @override
  Widget build(BuildContext context) {
    var txtCari = TextField(
      controller: list.ctrlCari,
      keyboardType: TextInputType.text,
      autofocus: false,
      onSubmitted: (val) {
        list.changeValCari(val);
        list.refreshData();
      },
      onChanged: (val) {
        list.changeValCari(val);
        list.refreshData();
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
        suffixIcon: Obx(
          () => (list.valCari.value != '')
              ? Container(
                  width: getSizeH4(context),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Icons.close,
                      size: getSizeH4(context),
                      color: Colors.grey[400],
                    ),
                    shape: CircleBorder(),
                    onPressed: () {
                      list.ctrlCari.text = '';
                      list.changeValCari(list.ctrlCari.text);
                      list.refreshData();
                    },
                  ),
                )
              : Container(
                  width: getSizeH4(context),
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
                // SizedBox(
                //   width: 10,
                // ),
                // Flexible(
                //   flex: 1,
                //   child: Text(
                //     'Filter',
                //     style: TextStyle(fontSize: getSizeH9(context)),
                //   ),
                // ),
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
                    // list.refreshData();
                  },
                  child: (list.daftar_rtlh.value.length != 0)
                      ? GridView.builder(
                          controller: list.scrollController,
                          shrinkWrap: true,
                          itemCount: list.daftar_rtlh.value.length + 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 0.8,
                                  crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            if (index == list.daftar_rtlh.value.length) {
                              return list.buildProgressIndicator();
                            } else {
                              dynamic last = list.daftar_rtlh.value[index];
                              return Card(
                                child: LayoutBuilder(
                                  builder: (context, constraint) => Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Parent(
                                          style: boxStyle.clone()
                                            ..borderRadius(
                                                topLeft: 5, topRight: 5)
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(last.nik),
                                            Text(last.nama),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                  elevation: 0,
                                                  child: Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                        color: lightColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  color: yellowColor,
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                  elevation: 0,
                                                  child: Text(
                                                    'Upload',
                                                    style: TextStyle(
                                                        color: lightColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  color: redColor,
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                          })
                      : (!list.isLoading.value)
                          ? ListView(
                              controller: list.scrollController,
                              children: [
                                Center(
                                  child: Text(
                                    'Data kosong',
                                    style:
                                        TextStyle(fontSize: getSizeH9(context)),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                ),
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
