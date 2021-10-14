import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  // Show or hide password
  var showPassword = true.obs;
  void visiblePassword() => showPassword.value = !showPassword.value;
}
