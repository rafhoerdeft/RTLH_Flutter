import 'package:flutter/material.dart';
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
        Text('Tap back again to close', style: TextStyle(fontSize: 20)),
      ],
    ),
  );
}

tampilToast(BuildContext context, String content, Color color) {
  Toast.show(content, context,
      backgroundColor: color,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM);
}
