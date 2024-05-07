import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final registerC = Get.put(RegisterController());
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
                      title: 'Welcome!',
                      subtitle: 'Please enter your account here',
                    ),
                    textfieldIcon(
                      controller: registerC.username,
                      hintText: 'Email or phone number',
                      icon: SvgPicture.asset(AssetIcons.message),
                      isRequired: 'Email or phone number is required !',
                    ),
                    textfieldPassword(
                      controller: registerC.password,
                      obsecure: registerC.showPassword.value,
                      hintText: 'Password',
                      icon: SvgPicture.asset(AssetIcons.lock),
                      onTap: () => registerC.visiblePassword(),
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
                              isOk: registerC.eightChars.value),
                          const SizedBox(height: 15),
                          itemContain(
                              label: 'Contains a number',
                              isOk: registerC.hasNumber.value),
                          const SizedBox(height: 15),
                          itemContain(
                              label: 'Contains a special character',
                              isOk: registerC.hasSpecialCharacters.value),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 24),
                      child: Button(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.toNamed('/auth/verify');
                          }
                        },
                        txtButton: 'Sign Up',
                        color: AppColors.primary,
                        disable: registerC.btnDisable.value,
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
