// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'config/routes/router.dart';
import 'config/routes/router_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
      statusBarColor: Color(0xFF2f2546),
      // statusBarBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Login',
      theme: ThemeData(
        fontFamily: 'Nunito',
        // accentColor: Colors.grey[800],
        // brightness: Brightness.dark,
        // primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Color(0xFFe4ebef),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: LoginPage(),
      // onGenerateRoute: onGenerateRoute,
      initialRoute: SplashRoute,
      getPages: router,
    );
  }
}
