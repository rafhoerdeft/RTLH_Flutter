import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateRtlhPage extends StatefulWidget {
  @override
  _UpdateRtlhPageState createState() => _UpdateRtlhPageState();
}

class _UpdateRtlhPageState extends State<UpdateRtlhPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Update ${Get.arguments}'),
    );
  }
}
