import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:rtlh_app/config/config.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toast/toast.dart';

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
    content: Row(
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

closeFlushBar(BuildContext context) {
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
                fontSize: getSizeH9(context),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    ),
    duration: Duration(seconds: 3),
  )..show(context);
}

tampilToast(BuildContext context, String content, Color color) {
  Toast.show(content, context,
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
                fontSize: getSizeH9(context),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    ),
    duration: Duration(seconds: 3),
  )..show(context);
}
