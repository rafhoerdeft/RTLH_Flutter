import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../config/config.dart';
import '../../controller/dashboard_controller.dart';
import '../style/dashboard_style.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController dash = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    // print(getWidth() / 100 * 3.65);
    var _list = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 95),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                  color: pmColor,
                  fontSize: getSizeH8(),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              // height: getHeight() * 1 / 2.35,
              child: Obx(
                () => GridView.count(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5,
                  children: dash.list_grid.value.asMap().entries.map((grid) {
                    if (grid.value.count == 'x') {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        child: Parent(
                          style: gridDashStyle.clone()
                            ..padding(all: 0)
                            ..background.color(lightColor),
                        ),
                      );
                    } else {
                      return Parent(
                        style: gridDashStyle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    grid.value.title,
                                    style: TextStyle(
                                        color: lightColor,
                                        fontSize: getSizeH9(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    grid.value.count,
                                    style: TextStyle(
                                        color: lightColor,
                                        fontSize: getSizeH8(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            LayoutBuilder(
                              builder: (context, constraint) => Icon(
                                grid.value.icon,
                                color: lightColor,
                                size: constraint.biggest.height - 15,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }).toList(),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: lightColor,
              height: 25,
            ),
            Text(
              'Terakhir Update',
              style: TextStyle(
                  color: pmColor,
                  fontSize: getSizeH8(),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Obx(
              () => (dash.loading_last_update.value)
                  ? Column(
                      children: dash.last_update.value.asMap().entries.map(
                        (last) {
                          return Parent(
                            style: gridDashStyle.clone()
                              ..background.color(lightColor)
                              ..padding(all: 15)
                              ..margin(top: 10),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Row(
                                children: [
                                  Container(
                                    height: getSizeH1(),
                                    width: getSizeH1(),
                                    decoration: BoxDecoration(
                                      color: lightColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: getSizeH8(),
                                          width: 220,
                                          decoration: BoxDecoration(
                                            color: lightColor,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: getSizeH8(),
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: lightColor,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    )
                  : Column(
                      children: dash.last_update.value.asMap().entries.map(
                        (last) {
                          return Parent(
                            style: gridDashStyle.clone()
                              ..background.color(lightColor)
                              ..padding(all: 15)
                              ..margin(top: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  size: getSizeH1(),
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
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: getSizeH9(),
                                            fontWeight: FontWeight.bold,
                                            color: pmColor),
                                      ),
                                      Text(
                                        "Nama : " + last.value.nama,
                                        style: TextStyle(
                                          fontSize: getSizeH9(),
                                          fontWeight: FontWeight.bold,
                                          color: pmColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
            ),
          ],
        )
      ],
    );

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            // floating: true,
            // elevation: 4,
            // snap: true,
            automaticallyImplyLeading: false,
            // title: Text('MyApp'),
            pinned: false,
            backgroundColor: Colors.transparent,
            expandedHeight: (getHeight(context) * 1 / 3) * 1 / 1.5,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Parent(
                style: headerDashStyle.clone()..padding(bottom: 10),
                child: Parent(
                  style: headerDashStyle.clone()
                    ..padding(bottom: 10)
                    ..background.color(redColor)
                    ..elevation(3, opacity: 0.9),
                  child: Parent(
                    style: headerDashStyle.clone()..background.color(pmColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Hi, ',
                                  style: TextStyle(
                                      fontSize: getSizeH6(), color: lightColor),
                                ),
                                Obx(
                                  () => Text(
                                    dash.nama_user.value,
                                    style: TextStyle(
                                        fontSize: getSizeH6(),
                                        color: lightColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Hero(
                              tag: 'iconPP',
                              child: Icon(
                                Icons.account_circle,
                                size: getSizeH1(),
                                color: lightColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                dash.nama_desa.value
                                        .capitalize('abc')
                                        .toString() +
                                    ", " +
                                    dash.nama_kec.value
                                        .capitalize('abc')
                                        .toString(),
                                style: TextStyle(
                                    fontSize: getSizeH8(), color: lightColor),
                              ),
                            ),
                            SizedBox(
                              height: getSizeH2(),
                              width: getSizeH1(),
                              child: MaterialButton(
                                splashColor: redColor,
                                padding: EdgeInsets.all(0),
                                elevation: 5,
                                // color: redColor,
                                onPressed: () {
                                  dash.getSyncs();
                                },
                                shape: CircleBorder(),
                                child: Obx(
                                  () => (dash.syncs.value)
                                      ? LayoutBuilder(
                                          builder: (context, constraint) =>
                                              SpinKitFadingCircle(
                                            color: Colors.white,
                                            size: constraint.biggest.height -
                                                5, //35
                                          ),
                                        )
                                      : LayoutBuilder(
                                          builder: (context, constraint) =>
                                              Icon(
                                            Icons.sync,
                                            size: constraint.biggest.height - 5,
                                            color: lightColor,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //     Container(
            //   color: Colors.red,
            // ),
          ),
        ];
      },
      body: _list,
    );
  }
}
