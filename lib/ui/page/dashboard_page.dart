import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:latihan_bloc/config/routes/router_name.dart';
import 'package:latihan_bloc/shared/login_shared.dart';
import '../../controller/dashboard_controller.dart';
import '../style/dashboard_style.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _formKey = GlobalKey<FormState>();
  final DashboardController dash = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    var _list = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 100),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                  color: Color(0xFF2f2546),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1 / 2.25,
              child: Obx(
                () => GridView.count(
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
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(grid.value.count,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Icon(
                            grid.value.icon,
                            color: Colors.white,
                            size: 50,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Text(
              'Terakhir Update',
              style: TextStyle(
                  color: Color(0xFF2f2546),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Obx(
              () => Column(
                children: dash.last_update.value.asMap().entries.map(
                  (last) {
                    return Parent(
                      style: gridDashStyle.clone()
                        ..background.color(Colors.white)
                        ..margin(top: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 50,
                            color: Color(0xFFCC0000),
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2f2546)),
                              ),
                              Text(
                                "Nama : " + last.value.nama,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2f2546),
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
            expandedHeight:
                (MediaQuery.of(context).size.height * 1 / 3) * 1 / 1.5,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Parent(
                style: headerDashStyle.clone()..padding(bottom: 5),
                child: Parent(
                  style: headerDashStyle.clone()
                    ..padding(bottom: 10)
                    ..background.color(Color(0xFFcc0000))
                    ..elevation(3, opacity: 0.5),
                  child: Parent(
                    style: headerDashStyle.clone()
                      ..background.color(Color(0xFF2f2546)),
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
                                      fontSize: 27, color: Colors.white),
                                ),
                                Obx(
                                  () => Text(
                                    dash.nama_user.value,
                                    style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.account_circle,
                              size: 50,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Butuh, Sawangan',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: MaterialButton(
                                splashColor: Color(0xFFcc0000),
                                padding: EdgeInsets.all(0),
                                elevation: 5,
                                // color: Color(0xFFcc0000),
                                onPressed: () {
                                  logout();
                                  Get.offAllNamed(LoginRoute);
                                },
                                shape: StadiumBorder(),
                                child: Icon(
                                  Icons.sync,
                                  size: 30,
                                  color: Colors.white,
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
