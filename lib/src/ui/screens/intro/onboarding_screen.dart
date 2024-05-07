import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 50),
                child: Image.asset(
                  AssetImages.onboardingImg,
                  width: SizeConfig().deviceWidth(context),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Text(
                'Start Cooking',
                style: TextTypography.mH1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: const Text(
                  'Let’s join our community to cook better food!',
                  style: TextTypography.sP1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
                child: Button(
                  disable: false,
                  onPressed: () {
                    Get.toNamed('/auth/login');
                  },
                  txtButton: 'Get Started',
                  color: AppColors.primary,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
