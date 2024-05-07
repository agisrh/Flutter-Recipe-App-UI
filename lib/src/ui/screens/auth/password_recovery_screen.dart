import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PasswordRecoveryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final passwordC = Get.put(PasswordController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  titleGreeting(
                    title: 'Password recovery',
                    subtitle: 'Enter your email to recover your password',
                  ),
                  textfieldIcon(
                    controller: passwordC.username,
                    hintText: 'Email address',
                    icon: SvgPicture.asset(AssetIcons.message),
                    isRequired: 'Email is required !',
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Button(
                      disable: false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed('/auth/password/change');
                        }
                      },
                      txtButton: 'Recovery',
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
