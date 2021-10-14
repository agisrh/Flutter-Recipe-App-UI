import 'package:get/get.dart';

class OtherController extends GetxController {
  var choice = 0.obs;
  void setChoice(int index) => choice.value = index;
}
