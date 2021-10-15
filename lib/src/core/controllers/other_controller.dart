import 'package:get/get.dart';

class OtherController extends GetxController {
  var choice = 0.obs;
  void setChoice(int index) => choice.value = index;

  var sliderValue = 30.0.obs;
  void setSlider(double value) => sliderValue.value = value;
}
