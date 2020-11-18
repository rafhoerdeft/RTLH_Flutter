import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:rtlh_app/controller/rtlh_controller.dart';
import '../../config/config.dart';
import '../../ui/style/all_style.dart';

class RtlhPage extends StatefulWidget {
  @override
  _RtlhPageState createState() => _RtlhPageState();
}

class _RtlhPageState extends State<RtlhPage> {
  @override
  Widget build(BuildContext context) {
    final List<TabList> tabList = [];

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.0),
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
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Txt(
                            'Daftar',
                            style: txtStyle.clone()
                              ..fontSize(getSizeH9(context)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Txt(
                            'Pending',
                            style: txtStyle.clone()
                              ..fontSize(getSizeH9(context)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Txt(
                            'Upload',
                            style: txtStyle.clone()
                              ..fontSize(getSizeH9(context)),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          body: TabBarView(children: [
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ]),
        ));
  }
}
