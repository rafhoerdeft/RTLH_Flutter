import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/sum_controller.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final SumController sum = Get.put(SumController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(() => Text("Counter #1: ${sum.count1}")),
          Obx(() => Text("Counter #2: ${sum.count2}")),
          SizedBox(width: 100, child: Divider(color: Colors.black)),
          Obx(() => Text("Counter #2: ${sum.sum}")),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Increment Counter #1'),
            onPressed: () {
              sum.increment1();
            },
          ),
          RaisedButton(
            child: Text('Increment Counter #2'),
            onPressed: () {
              sum.increment2();
            },
          ),
        ],
      ),
    );
  }
}
