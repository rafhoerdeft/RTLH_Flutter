// import 'package:firebase_core/firebase_core.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'config/config.dart';
import 'config/routes/router.dart';
import 'config/routes/router_name.dart';
import 'config/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // runApp(DevicePreview(builder: (context) => RtlhApp()));
  runApp(RtlhApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp();
  }
}

class RtlhApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: pmColor,
      // statusBarBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Login',
      // theme: ThemeData(
      //   fontFamily: 'Nunito',
      //   scaffoldBackgroundColor: Color(0xFFe4ebef),
      //   primarySwatch: Colors.deepPurple,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      theme: appThemeData,
      // home: LoginPage(),
      // onGenerateRoute: onGenerateRoute,
      initialRoute: SplashRoute,
      getPages: router,
    );
  }
}
