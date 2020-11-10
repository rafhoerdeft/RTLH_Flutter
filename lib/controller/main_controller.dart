import 'package:get/get.dart';

class MainController extends GetxController {
  final slideActive = 0.obs;

  changeSlide(int index) {
    slideActive.value = index;
  }
}
