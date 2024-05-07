import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final loginC = Get.put(LoginController());
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
                    title: 'Welcome Back!',
                    subtitle: 'Please enter your account here',
                  ),
                  textfieldIcon(
                    controller: loginC.username,
                    hintText: 'Email or phone number',
                    icon: SvgPicture.asset(AssetIcons.message),
                    isRequired: 'Email or phone number is required !',
                  ),
                  Obx(
                    () => textfieldPassword(
                      controller: loginC.password,
                      obsecure: loginC.showPassword.value,
                      hintText: 'Password',
                      isRequired: 'Password is required !',
                      icon: SvgPicture.asset(AssetIcons.lock),
                      onTap: () => loginC.visiblePassword(),
                    ),
                  ),
                  InkWell(
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password?',
                        style:
                            TextStyle(color: AppColors.mainText, fontSize: 15),
                      ),
                    ),
                    onTap: () => Get.toNamed('/auth/password/recovery'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 24),
                    child: Button(
                      disable: false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed('/home');
                        }
                      },
                      txtButton: 'Login',
                      color: AppColors.primary,
                    ),
                  ),
                  const Text('Or continue with', style: TextTypography.sP2),
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 24),
                    child: ButtonIcon(
                      onPressed: () {},
                      txtButton: 'Google',
                      color: AppColors.secondary,
                      icon: const Icon(
                        FontAwesome.google,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  richTextLink(
                    title: 'Don’t have any account?',
                    linkText: ' Sign up',
                    onTap: () {
                      Get.toNamed('/auth/register');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
