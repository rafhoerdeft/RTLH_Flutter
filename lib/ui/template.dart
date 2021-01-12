import 'package:auto_size_text/auto_size_text.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../ui/page/rtlh_page.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    tmp.permissionAccessHardware();
  }

  @override
  Widget build(BuildContext context) {
    tmp.checkConnectInternet(context);

    final List<PagesList> pagesList = [
      PagesList(
        page: DashboardPage(),
        icon: Icons.web,
        title: 'Dashboard',
        color: redColor,
        sizeIcon: getSizeH5(),
      ),
      PagesList(
        page: RtlhPage(),
        icon: RtlhIcon.logo_rtlh,
        title: 'RTLH',
        color: redColor,
        sizeIcon: getSizeH6() - 2,
      ),
      PagesList(
        page: ProfilPage(),
        icon: OMIcons.person,
        title: 'Profil',
        color: redColor,
        sizeIcon: getSizeH5(),
      ),
    ];

    var _body = GetBuilder<TemplateController>(
      builder: (tmp) => PageView(
        // scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          tmp.changePage(index, pagesList[index].title);
        },
        controller: tmp.pageCtrl,
        // physics: NeverScrollableScrollPhysics(),
        children: pagesList.map((pg) => pg.page).toList(),
      ),
    );

    var _bubbleNav = Container(
      // height: getSizeH4() + getSizeH4(),
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
                icon: LayoutBuilder(
                  builder: (context, constraint) => Icon(
                    pg.value.icon,
                    color: Colors.grey[400],
                    size: pg.value.sizeIcon,
                  ),
                ),
                activeIcon: LayoutBuilder(
                  builder: (context, constraint) => Icon(
                    pg.value.icon,
                    color: lightColor,
                    size: constraint.biggest.height - 15, //33,
                  ),
                ),
                title: AutoSizeText(
                  pg.value.title,
                  style:
                      TextStyle(color: lightColor, fontSize: getSizeH9() - 2),
                  maxLines: 1,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
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
