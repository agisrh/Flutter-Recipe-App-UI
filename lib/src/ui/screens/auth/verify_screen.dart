import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final verifyC = Get.put(VerifyController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Obx(
        () => Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  titleGreeting(
                    title: 'Check your email',
                    subtitle: 'We’ve sent the code to your email',
                  ),
                  textfieldOTP(context: context, length: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'code expires in: ',
                        style: TextTypography.mP2,
                      ),
                      Text(
                        verifyC.counter.value.toString(),
                        style: const TextStyle(color: AppColors.secondary),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: Button(
                      onPressed: () {
                        dialog(
                          title: 'Register Success',
                          subtitle:
                              'Your account has been registered, now you can login',
                          icon: Image.asset(AssetImages.emoticonParty),
                          txtButton: 'Back to Login',
                          onPressed: () {
                            Get.offAllNamed('/auth/login');
                          },
                        );
                      },
                      txtButton: 'Verify',
                      color: AppColors.primary,
                    ),
                  ),
                  ButtonOutline(
                    onPressed: () {
                      verifyC.startTimer();
                    },
                    disable: verifyC.timeStart.value,
                    txtButton: 'Resend',
                    color: AppColors.secondaryText,
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
