import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
// import 'package:latihan_bloc/ui/page/main_page.dart';
import '../config/routes/router_name.dart';
import '../controller/template_controller.dart';
// import '../shared/login_shared.dart';
// import '../ui/page/map_page.dart';
import '../ui/page/crud_page.dart';
import '../ui/page/dashboard_page.dart';
import '../ui/page/profil_page.dart';
import '../widget/dialog_widget.dart';
import '../widget/Icons/rtlh_icon_icons.dart';

class TemplatePage extends StatefulWidget {
  @override
  _TemplatePageState createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TemplateController tmp = Get.put(TemplateController());

  final List<PagesList> pagesList = [
    PagesList(
      page: DashboardPage(),
      icon: Icons.web,
      title: 'Dashboard',
      color: Color(0xFFcc0000),
    ),
    PagesList(
      page: ProfilPage(),
      icon: RtlhIcon.logo_rtlh,
      title: 'RTLH',
      color: Color(0xFFcc0000),
    ),
    PagesList(
      page: CrudPage(),
      icon: Icons.person,
      title: 'Profil',
      color: Color(0xFFcc0000),
    ),
    // PagesList(
    //   page: MapPage(),
    //   icon: Icons.map,
    //   title: 'Map',
    //   color: Color(0xFFcc0000),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      backgroundColor: Color(0xFF2f2546),
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed: () {
      //     _scaffoldKey.currentState.openDrawer();
      //   },
      // ),
      title: Obx(() => Text("${tmp.title}")),
      centerTitle: true,
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.more_vert),
      //     onPressed: () {},
      //   ),
      // ],
    );

    var _body = GetBuilder<TemplateController>(
      builder: (tmp) => PageView(
        // scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          tmp.changePage(index, pagesList[index].title);
        },
        controller: tmp.pageCtrl,
        physics: NeverScrollableScrollPhysics(),
        children: pagesList.map((pg) => pg.page).toList(),
      ),
    );

    var _bubbleNav = Container(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Color(0xFF2F2546),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 2.0,
                offset: Offset(0.0, 3.0))
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        // color: Colors.black26,
        child: Obx(
          () => BubbleBottomBar(
            backgroundColor: Color(0xFF2F2546),
            hasNotch: false,
            // fabLocation: BubbleBottomBarFabLocation.end,
            opacity: 1.0,
            currentIndex: tmp.page_active.value,
            onTap: (index) {
              tmp.changePage(index, pagesList[index].title);
            },
            borderRadius: BorderRadius.circular(
                15), //border radius doesn't work when the notch is enabled.
            elevation: 0,
            items: pagesList.asMap().entries.map((pg) {
              return BubbleBottomBarItem(
                backgroundColor: pg.value.color,
                icon: Icon(
                  pg.value.icon,
                  color: Colors.grey[400],
                ),
                activeIcon: Icon(
                  pg.value.icon,
                  color: Colors.white,
                  size: 33,
                ),
                title: Text(
                  pg.value.title,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );

    var _fab = FloatingActionButton(
      child: Icon(Icons.dashboard),
      tooltip: 'Floating Menu',
      backgroundColor: Colors.teal,
      onPressed: () {
        Get.toNamed(MainRoute);
      },
    );

    var _fabDial = SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      // overlayColor: Colors.teal,
      overlayOpacity: 0.5,
      // closeManually: false,
      curve: Curves.decelerate,
      children: [
        SpeedDialChild(
            child: Icon(Icons.ac_unit),
            label: 'First Button',
            onTap: () {},
            backgroundColor: Colors.amber[700]),
        SpeedDialChild(
          child: Icon(Icons.ac_unit),
          label: 'First Button',
          backgroundColor: Colors.teal,
          onTap: () {},
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFFe4ebef),
      key: _scaffoldKey,
      // appBar: _appBar,
      extendBody: true,
      body: DoubleBackToCloseApp(
        snackBar: closeSnackBar(),
        child: _body,
      ),
      bottomNavigationBar: _bubbleNav,
      // floatingActionButton: _fab,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
