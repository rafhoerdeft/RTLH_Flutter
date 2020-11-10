import 'package:flutter/material.dart';

class Sizes23 {
  dynamic width;
  dynamic height;

  getSize(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width * 2 / 3;
  }
}
