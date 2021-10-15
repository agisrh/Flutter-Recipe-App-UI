import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/utils/assets_util.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class Step2Screen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final step2C = Get.put(UploadController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 70),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: pagination(currentPage: '2', nextPage: '2'),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 24, bottom: 10),
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
                    SizedBox(height: 10),
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
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: ButtonDefault(
                        onPressed: () {},
                        txtButton: '+ Ingredient',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
