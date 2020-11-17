import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../config/config.dart';
import '../controller/template_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    final List<PagesList> pagesList = [
      PagesList(
        page: DashboardPage(),
        icon: Icons.web,
        title: 'Dashboard',
        color: redColor,
        sizeIcon: getWidth(context) / 100 * 7.05, //29
      ),
      PagesList(
        page: ProfilPage(),
        icon: RtlhIcon.logo_rtlh,
        title: 'RTLH',
        color: redColor,
        sizeIcon: getWidth(context) / 100 * 6, //25
      ),
      PagesList(
        page: ProfilPage(),
        icon: OMIcons.person,
        title: 'Profil',
        color: redColor,
        sizeIcon: getWidth(context) / 100 * 7.05, //29
      ),
    ];

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
          color: pmColor,
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
            backgroundColor: pmColor,
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
                  size: pg.value.sizeIcon,
                ),
                activeIcon: Icon(
                  pg.value.icon,
                  color: lightColor,
                  size: getWidth(context) / 100 * 8.1, //33,
                ),
                title: Text(
                  pg.value.title,
                  style: TextStyle(
                      color: lightColor, fontSize: getSizeH9(context)),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );

    return Scaffold(
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
