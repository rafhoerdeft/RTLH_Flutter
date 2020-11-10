import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ParentStyle buttonStyle = ParentStyle(angleFormat: AngleFormat.degree)
  ..background.color(Colors.lightBlue)
  ..borderRadius(all: 60)
  ..border(all: 3, color: Colors.lightBlue[900])
  ..elevation(5)
  ..padding(left: 15, right: 15, top: 10, bottom: 10)
  ..rotate(-5)
  ..ripple(true, splashColor: Colors.yellow);

TxtStyle txtBtnStyle = TxtStyle()
  ..fontSize(20)
  ..fontFamily('Nunito')
  ..bold()
  ..textColor(Colors.white)
  ..textAlign.center();
