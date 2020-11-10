import 'package:division/division.dart';
import 'package:flutter/material.dart';
import '../ui/style/boxcard_style.dart';

class BoxCardWidget extends StatelessWidget {
  Container content = Container();
  double mgTop;
  double mgBottom;
  double mgLeft;
  double mgRight;

  BoxCardWidget(
      {this.content, this.mgTop, this.mgBottom, this.mgLeft, this.mgRight});

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: content,
      style: boxCardStyle.clone()
        ..margin(left: mgLeft, right: mgRight, top: mgTop, bottom: mgBottom),
    );
  }
}
