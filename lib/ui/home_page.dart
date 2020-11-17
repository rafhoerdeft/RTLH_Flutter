import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/routes/router_name.dart';
import '../shared/login_shared.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama_user = '';

  void getNama() async {
    await getNamaUser().then((value) {
      setState(() {
        nama_user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getNama();
    final profil = Hero(
      tag: 'Here',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/logo/alucard.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome $nama_user',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, ',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final btnLogout = Align(
      alignment: Alignment.bottomCenter,
      child: RaisedButton(
        color: Colors.amber,
        child: Text('Sign Out'),
        onPressed: () {
          logout();
          Get.offAllNamed(LoginRoute);
        },
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ]),
      ),
      child: Column(
        children: <Widget>[profil, welcome, lorem, btnLogout],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
