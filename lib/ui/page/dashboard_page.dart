import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:latihan_bloc/config/routes/router_name.dart';
import 'package:latihan_bloc/shared/login_shared.dart';
import 'package:latihan_bloc/widget/Icons/rtlh_icon_icons.dart';
import '../../controller/dashboard_controller.dart';
import '../style/dashboard_style.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _formKey = GlobalKey<FormState>();
  final DashboardController dash = Get.put(DashboardController());

  final List<GridList> gridList = [
    GridList(
      icon: RtlhIcon.logo_rtlh,
      title: 'RTLH',
      count: '0',
    ),
    GridList(
      icon: Icons.verified,
      title: 'Diterima',
      count: '0',
    ),
    GridList(
      icon: Icons.cancel_outlined,
      title: 'Ditolak',
      count: '0',
    ),
    GridList(
      icon: Icons.settings,
      title: 'Diproses',
      count: '0',
    ),
  ];

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
              height: MediaQuery.of(context).size.height * 1 / 2.2,
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5,
                children: gridList.asMap().entries.map((grid) {
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
            Text(
              'Hari ini',
              style: TextStyle(
                  color: Color(0xFF2f2546),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
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
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
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
