import 'package:division/division.dart';
import 'package:flutter/material.dart';
import '../ui/style/button_style.dart';

class ButtonWidget extends StatefulWidget {
  final ParentStyle btnStyle;
  final Gestures btnGesture;

  ButtonWidget({this.btnStyle, this.btnGesture});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool isTapDown = false;
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Container(
        child: Txt(
          "Update User",
          style: txtBtnStyle,
        ),
      ),
      style: widget.btnStyle.clone()
        ..scale((isTapDown) ? 1.1 : 1)
        ..elevation((isTapDown) ? 0 : 5),
      gesture: widget.btnGesture
        ..onTapDown((details) {
          setState(() {
            isTapDown = true;
          });
        })
        ..onTapUp((details) {
          setState(() {
            isTapDown = false;
          });
        })
        ..onTapCancel(() {
          setState(() {
            isTapDown = false;
          });
        }),
    );
  }
}
