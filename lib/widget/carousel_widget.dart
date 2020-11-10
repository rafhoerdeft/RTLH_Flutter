import 'package:division/division.dart';
import 'package:flutter/material.dart';
import '../ui/style/carousel_style.dart';

class CarouselBox extends StatelessWidget {
  final String url;

  CarouselBox(this.url);
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: carouselStyle.clone()
        ..background.image(url: url, fit: BoxFit.cover),
    );
  }
}
