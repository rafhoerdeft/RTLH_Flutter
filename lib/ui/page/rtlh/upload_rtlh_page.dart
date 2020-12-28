import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadRtlhPage extends StatefulWidget {
  @override
  _UploadRtlhPageState createState() => _UploadRtlhPageState();
}

class _UploadRtlhPageState extends State<UploadRtlhPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Upload ${Get.arguments}'),
    );
  }
}
