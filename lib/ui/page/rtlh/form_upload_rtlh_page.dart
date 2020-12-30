import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormUploadRtlhPage extends StatefulWidget {
  @override
  _FormUploadRtlhPageState createState() => _FormUploadRtlhPageState();
}

class _FormUploadRtlhPageState extends State<FormUploadRtlhPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Upload ${Get.arguments}'),
    );
  }
}
