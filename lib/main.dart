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

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Login',
      theme: ThemeData(
        // accentColor: Colors.grey[800],
        // brightness: Brightness.dark,
        // primarySwatch: Colors.grey,
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
