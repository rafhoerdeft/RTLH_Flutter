import 'package:division/division.dart';
import 'package:flutter/material.dart';
import '../../controller/rtlh_controller.dart';
import '../../ui/page/rtlh/daftar_rtlh_page.dart';
import '../../ui/page/rtlh/pending_rtlh_page.dart';
import '../../ui/page/rtlh/upload_rtlh_page.dart';
import '../../config/config.dart';
import '../../ui/style/all_style.dart';

class RtlhPage extends StatefulWidget {
  @override
  _RtlhPageState createState() => _RtlhPageState();
}

class _RtlhPageState extends State<RtlhPage> {
  @override
  Widget build(BuildContext context) {
    final List<TabList> tabList = [
      TabList(title: 'Daftar', page: DaftarRtlhPage()),
      TabList(title: 'Pending', page: PendingRtlhPage()),
      TabList(title: 'Upload', page: UploadRtlhPage()),
    ];

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: Parent(
              style: boxStyle.clone()
                ..borderRadius(all: 0)
                ..background.color(redColor)
                ..padding(bottom: 10)
                ..elevation(2, opacity: 1),
              child: AppBar(
                backgroundColor: pmColor,
                elevation: 0,
                bottom: TabBar(
                  // physics: NeverScrollableScrollPhysics(),
                  labelColor: lightColor,
                  unselectedLabelColor: lightColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: redColor,
                  ),
                  tabs: tabList.asMap().entries.map((tab) {
                    return Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Txt(
                          tab.value.title,
                          style: txtStyle.clone()..fontSize(getSizeH9(context)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          body: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            children: tabList.asMap().entries.map((tab) {
              return tab.value.page;
            }).toList(),
          ),
        ));
  }
}
