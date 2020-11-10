import 'package:get/get.dart';
import 'package:latihan_bloc/model/user_model.dart';

class UserController extends GetxController {
  final user = User(name: 'null', age: 0).obs;

  updateUser(String name, int age) {
    user.update((val) {
      val.name = name;
      val.age = age;
    });
  }
}
