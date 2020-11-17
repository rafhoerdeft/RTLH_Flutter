import 'package:get/get.dart';
import '../config/database/sqflite_database.dart';

class CrudController extends GetxController {
  final queryRows = [].obs;

  showData() async {
    List<Map<String, dynamic>> row = await SqfliteDatabase.instance.selectAll();
    queryRows.value = row;
    // print(queryRows.value[0]['name']);
  }

  inputData(String name, int age) async {
    int i = await SqfliteDatabase.instance.insert(
        {SqfliteDatabase.columnName: name, SqfliteDatabase.columnAge: age});
    if (i > 0) {
      showData();
    }
  }

  updateData(int id, String name, int age) async {
    int rowEffected = await SqfliteDatabase.instance.update({
      SqfliteDatabase.columnId: id,
      SqfliteDatabase.columnName: name,
      SqfliteDatabase.columnAge: age
    });
    if (rowEffected > 0) {
      showData();
    }
  }

  deleteData(int id) async {
    int rowEffected = await SqfliteDatabase.instance.delete(id);
    if (rowEffected > 0) {
      showData();
    }
  }
}
