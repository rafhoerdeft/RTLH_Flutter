import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../config/routes/router_name.dart';
import '../controller/template_controller.dart';
import '../shared/login_shared.dart';
import '../ui/page/map_page.dart';
import '../ui/page/crud_page.dart';
import '../ui/page/dashboard_page.dart';
import '../ui/page/profil_page.dart';
import '../widget/dialog_widget.dart';

class TemplatePage extends StatefulWidget {
  @override
  _TemplatePageState createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TemplateController tmp = Get.put(TemplateController());

  final List<PagesList> pagesList = [
    PagesList(page: DashboardPage(), icon: Icons.web, title: 'Dashboard'),
    PagesList(page: ProfilPage(), icon: Icons.people, title: 'Profil'),
    PagesList(page: CrudPage(), icon: Icons.input, title: 'CRUD SQFLite'),
    PagesList(page: MapPage(), icon: Icons.map, title: 'Map'),
  ];

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      backgroundColor: Colors.teal,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      title: Obx(() => Text("${tmp.title}")),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Color(0xff6610f2)],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
          image: DecorationImage(
            image: AssetImage('assets/img/background/pattern-dot.png'),
            fit: BoxFit.fill,
            repeat: ImageRepeat.repeat,
            //make trasparent
            colorFilter: ColorFilter.mode(
                Colors.teal.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
      ),
    );

    var _headerSideNav = DrawerHeader(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.teal])),
      child: Column(
        children: <Widget>[
          Text(
            'Side Navigation',
            style: TextStyle(color: Colors.white),
          ),
          Text('Tetek mak lampir gede', style: TextStyle(color: Colors.white))
        ],
      ),
    );

    var _sideNav = Drawer(
      child: ListView(
        children: <Widget>[
          _headerSideNav,
          ListTile(
            title: Text('Tutorial'),
            leading: Icon(Icons.filter),
            onTap: () {},
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.face),
            onTap: () {},
          ),
          ListTile(
            title: Text('SIgn Out'),
            leading: Icon(Icons.settings_power),
            onTap: () {
              logout();
              Get.offAllNamed(LoginRoute);
            },
          ),
        ],
      ),
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

    var _nav = BottomNavigationBar(
      selectedItemColor: Colors.teal,
      // backgroundColor: Colors.teal,
      currentIndex: 1,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.refresh),
          title: Text('Reload'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.face),
          title: Text('Flutter'),
        ),
      ],
    );

    var _bottomNav = BottomAppBar(
      elevation: 0,
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: GetBuilder<TemplateController>(
        builder: (val) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: pagesList.asMap().entries.map((pg) {
            return IconButton(
              tooltip: pg.value.title,
              padding: EdgeInsets.all(15),
              icon: Icon(
                pg.value.icon,
                color: (val.page_active == pg.key)
                    ? Colors.blue
                    : Colors.grey[700],
              ),
              onPressed: () {
                tmp.changePage(pg.key, pg.value.title);
              },
            );
          }).toList(),
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
      key: _scaffoldKey,
      appBar: _appBar,
      body: DoubleBackToCloseApp(
        snackBar: closeSnackBar(),
        child: _body,
      ),
      bottomNavigationBar: _bottomNav,
      drawer: _sideNav,
      floatingActionButton: _fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
