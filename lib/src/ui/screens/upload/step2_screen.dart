import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class Step2Screen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final step2C = Get.put(UploadController());

  Step2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: pagination(currentPage: '2', nextPage: '2'),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 24, bottom: 10),
                    child: labelForm(label: 'Ingredients'),
                  ),
                  ListTile(
                    minLeadingWidth: 10,
                    leading: SvgPicture.asset(AssetIcons.drag),
                    title: textfield(
                      controller: step2C.ingredient,
                      hintText: 'Enter Ingredient',
                      isRequired: 'Ingredient is required !',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    minLeadingWidth: 10,
                    leading: SvgPicture.asset(AssetIcons.drag),
                    title: textfield(
                      controller: step2C.ingredient,
                      hintText: 'Enter Ingredient',
                      isRequired: 'Ingredient is required !',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: ButtonOutline(
                      onPressed: () {},
                      color: AppColors.outline,
                      colorLabel: AppColors.titleText,
                      txtButton: '+ Ingredient',
                    ),
                  ),
                  divider(),
                  Container(
                    margin: const EdgeInsets.only(left: 24, bottom: 10),
                    child: labelForm(label: 'Steps'),
                  ),
                  ListTile(
                    minLeadingWidth: 10,
                    leading: stepNumber(number: 1),
                    title: textarea(
                      controller: step2C.ingredient,
                      hintText: 'Tell a little about your food',
                      minLines: 4,
                    ),
                    subtitle: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        color: AppColors.form,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: SvgPicture.asset(AssetIcons.camera),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonDefault(
                          width: SizeConfig().deviceWidth(context) / 2.5,
                          onPressed: () {
                            Get.back();
                          },
                          txtButton: 'Back',
                        ),
                        Button(
                          disable: false,
                          width: SizeConfig().deviceWidth(context) / 2.5,
                          onPressed: () {
                            dialog(
                              title: 'Upload Success',
                              subtitle:
                                  'Your recipe has been uploaded, you can see it on your profile',
                              icon: Image.asset(AssetImages.emoticonParty),
                              txtButton: 'Back to Home',
                              onPressed: () {
                                Get.offAllNamed('/home');
                              },
                            );
                          },
                          txtButton: 'Done',
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
