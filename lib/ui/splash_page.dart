import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../config/routes/router_name.dart';
import '../controller/route_controller.dart';
import 'package:splashscreen/splashscreen.dart';
// import '../shared/login_shared.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // splash() async {
  //   await Future.delayed(Duration(seconds: 3), () {
  //     getStatus().then((value) =>
  //         (value) ? Get.offNamed(HomeRoute) : Get.offNamed(LoginRoute));
  //   });
  // }

  final RouteController rc = Get.put(RouteController());

  @override
  void initState() {
    super.initState();
    // splash();
    rc.cek_auth();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.blue[900],
    //   body: SafeArea(
    //     child: Center(
    //       child: SpinKitFadingCube(
    //         color: Colors.white,
    //         size: 50.0,
    //       ),
    //     ),
    //   ),
    // );

    return Obx(
      () => SplashScreen(
        // loadingText: Text('loading..'),
        seconds: 3,
        // the widget to run after running your splashscreen
        navigateAfterSeconds: rc.route.value,
        // title: Text(
        //   '[ RTLH APP ]',
        //   style: TextStyle(
        //     fontFamily: 'Nunito',
        //     fontSize: 30,
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        image: Image.asset(
          'assets/logo/logo_rtlh_red.png',
          height: 120,
          alignment: Alignment.center,
        ),
        backgroundColor: Color(0xFF1c1a30),
        // styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.amber,
      ),
    );
  }
}
