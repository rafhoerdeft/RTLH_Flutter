import 'package:division/division.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../config/config.dart';
import '../../config/routes/router_name.dart';
import '../../shared/login_shared.dart';
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
    // print(getWidth(context) / 100 * 3.65);
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
                  fontSize: getSizeH7(context),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              // height: getHeight(context) * 1 / 2.35,
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
                    return Parent(
                      style: gridDashStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                grid.value.title,
                                style: TextStyle(
                                    color: lightColor,
                                    fontSize: getSizeH7(context) - 2,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                grid.value.count,
                                style: TextStyle(
                                    color: lightColor,
                                    fontSize: getSizeH7(context) - 2,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Icon(
                            grid.value.icon,
                            color: lightColor,
                            size: getSizeH1(context),
                          ),
                        ],
                      ),
                    );
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
                  fontSize: getSizeH7(context),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Obx(
              () => Column(
                children: dash.last_update.value.asMap().entries.map(
                  (last) {
                    return Parent(
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
                    ..elevation(4, opacity: 0.8),
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
                                      fontSize: getSizeH5(context),
                                      color: lightColor),
                                ),
                                Obx(
                                  () => Text(
                                    dash.nama_user.value,
                                    style: TextStyle(
                                        fontSize: getSizeH5(context),
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
                                size: getSizeH1(context),
                                color: lightColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Butuh, Sawangan',
                              style: TextStyle(
                                  fontSize: getSizeH7(context),
                                  color: lightColor),
                            ),
                            SizedBox(
                              height: getSizeH2(context),
                              width: getSizeH1(context),
                              child: MaterialButton(
                                splashColor: redColor,
                                padding: EdgeInsets.all(0),
                                elevation: 5,
                                // color: redColor,
                                onPressed: () {
                                  logout();
                                  Get.offAllNamed(LoginRoute);
                                },
                                shape: StadiumBorder(),
                                child: Icon(
                                  Icons.sync,
                                  size: getSizeH4(context),
                                  color: lightColor,
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
