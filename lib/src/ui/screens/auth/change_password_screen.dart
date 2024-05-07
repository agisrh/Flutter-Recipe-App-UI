import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final passwordC = Get.put(PasswordController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Obx(
        () => Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    titleGreeting(
                      title: 'Reset your password',
                      subtitle: 'Please enter your new password',
                    ),
                    textfieldPassword(
                      controller: passwordC.password,
                      obsecure: passwordC.showPassword.value,
                      hintText: 'Password',
                      icon: SvgPicture.asset(AssetIcons.lock),
                      onTap: () => passwordC.visiblePassword(),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Your Password must contain:',
                        style: TextTypography.mP2,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          itemContain(
                              label: 'Atleast 8 characters',
                              isOk: passwordC.eightChars.value),
                          const SizedBox(height: 15),
                          itemContain(
                              label: 'Contains a number',
                              isOk: passwordC.hasNumber.value),
                          const SizedBox(height: 15),
                          itemContain(
                              label: 'Contains a special character',
                              isOk: passwordC.hasSpecialCharacters.value),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 24),
                      child: Button(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            dialog(
                              title: 'Recovery Success',
                              subtitle: 'Your password has been changed',
                              icon: Image.asset(AssetImages.emoticonParty),
                              txtButton: 'Back to Login',
                              onPressed: () {
                                Get.offAllNamed('/auth/login');
                              },
                            );
                          }
                        },
                        txtButton: 'Change',
                        color: AppColors.primary,
                        disable: passwordC.btnDisable.value,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
