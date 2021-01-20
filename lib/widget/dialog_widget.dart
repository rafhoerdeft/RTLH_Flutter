import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:rtlh_app/config/config.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

tampilAlertUpdate(BuildContext ctx, String url) {
  AwesomeDialog(
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    context: ctx,
    customHeader: LayoutBuilder(
      builder: (context, constraint) => Image.asset(
        'assets/img/icon/icon_play.png',
        height: constraint.biggest.height - 40,
      ),
    ),
    headerAnimationLoop: false,
    animType: AnimType.TOPSLIDE,
    title: 'Update Aplikasi',
    desc:
        'Versi baru sudah rilis di PlayStore. Silahkan update aplikasi untuk menggunakan!',
    btnCancelIcon: Icons.cancel,
    btnCancelText: 'Keluar',
    btnCancelOnPress: () {
      exit(0);
    },
    btnOkIcon: Icons.check_circle,
    btnOkText: 'Update',
    btnOkOnPress: () async {
      if (await canLaunch(url)) {
        await launch(url);
        exit(0);
      } else {
        // throw 'Tidak dapat membuka link PlayStore';
        tampilToast(
            ctx, 'Tidak dapat membuka link PlayStore', redColor, lightColor);
        exit(0);
      }
    },
  )..show();
}

tampilAlert(BuildContext ctx, String ctn) {
  showDialog(
    context: ctx,
    barrierDismissible: false,
    child: AlertDialog(
      title: Text('Alert'),
      content: Text(ctn),
      actions: <Widget>[
        FlatButton(
          child: Text('Okay'),
          onPressed: () {
            debugPrint(ctn);
            Navigator.of(ctx).pop();
          },
        ),
      ],
    ),
  );
}

tampilOption(BuildContext ctx) {
  showDialog(
      context: ctx,
      child: SimpleDialog(
        title: Text('Choose one'),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('Flutter'),
            onPressed: () {
              print('Flutter choise');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: Text('Ionic'),
            onPressed: () {
              print('Ionic choise');
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ));
}

tampilSnackbar(scaffoldKey, String lbl, String ctn) {
  var sb = SnackBar(
    content: Text(ctn),
    action: SnackBarAction(
      label: lbl,
      onPressed: () {},
    ),
  );

  scaffoldKey.currentState.showSnackBar(sb);
}

closeSnackBar() {
  return SnackBar(
    backgroundColor: Colors.amber[900],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Icon(
            Icons.warning,
            size: 35,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
            child: Text('Tekan Back lagi untuk keluar',
                style: TextStyle(fontSize: 17))),
      ],
    ),
    behavior: SnackBarBehavior.floating,
  );
}

closeFlushBar() {
  return Flushbar(
    // title: "Keluar Aplikasi",
    // message: "Tekan tombol Back lagi untuk keluar",
    backgroundColor: Colors.amber[900],
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.red,
    messageText: Row(
      children: <Widget>[
        Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Icon(
            Icons.warning,
            size: 35,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text('Tekan tombol Back lagi untuk keluar',
              style: TextStyle(
                fontSize: getSizeH9(),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    ),
    duration: Duration(seconds: 2),
  );
}

tampilToast(BuildContext context, String content, Color color, Color txtColor) {
  Toast.show(content, context,
      textColor: txtColor,
      backgroundColor: color,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM);
}

tampilFlushBar(BuildContext context, String content, Color color) {
  return Flushbar(
    // title: "Keluar Aplikasi",
    // message: "Tekan tombol Back lagi untuk keluar",
    backgroundColor: color,
    showProgressIndicator: false,
    progressIndicatorBackgroundColor: Colors.red,
    messageText: Row(
      children: <Widget>[
        Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Icon(
            Icons.warning,
            size: 35,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(content,
              style: TextStyle(
                fontSize: getSizeH9(),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    ),
    duration: Duration(seconds: 3),
  )..show(context);
}

tampilFlushBarErr(String content) {
  return Flushbar(
    // title: "Keluar Aplikasi",
    // message: "Tekan tombol Back lagi untuk keluar",
    backgroundColor: redColor,
    showProgressIndicator: false,
    progressIndicatorBackgroundColor: Colors.red,
    messageText: Row(
      children: <Widget>[
        Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Icon(
            Icons.warning,
            size: 35,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(content,
              style: TextStyle(
                fontSize: getSizeH9(),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    ),
    // duration: Duration(seconds: 3),
  );
}
