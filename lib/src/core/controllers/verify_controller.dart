import 'dart:async';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  var counter = "".obs;
  var timeStart = true.obs;
  late Timer _timer;
  int currentSeconds = 0;
  int timerMaxSeconds = 180;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}:${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  void startTimer() {
    timeStart.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentSeconds = timer.tick;
      if (timer.tick > timerMaxSeconds) {
        _timer.cancel();
        timeStart.value = false;
      } else {
        counter.value = timerText;
      }
    });
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
}
