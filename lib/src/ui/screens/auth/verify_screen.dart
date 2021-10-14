import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';

class VerifyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final verifyC = Get.put(VerifyController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Obx(
        () => Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  titleGreeting(
                    title: 'Check your email',
                    subtitle: 'We’ve sent the code to your email',
                  ),
                  textfieldOTP(context: context, length: 4),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'code expires in: ',
                          style: TextTypography.mP2,
                        ),
                        Text(
                          verifyC.counter.value.toString(),
                          style: TextStyle(color: AppColors.secondary),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
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
                  Container(
                    child: ButtonOutline(
                      onPressed: () {
                        verifyC.startTimer();
                      },
                      disable: verifyC.timeStart.value,
                      txtButton: 'Resend',
                      color: AppColors.secondaryText,
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
