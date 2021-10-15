import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/component_widget.dart';
import 'package:recipe_app/src/ui/widgets/form_widget.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class Step1Screen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final step1C = Get.put(UploadController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 70),
              pagination(currentPage: '1', nextPage: '2'),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 35),
                            width: SizeConfig().deviceWidth(context) / 1.2,
                            height: SizeConfig().deviceHeight(context) / 5,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(12),
                              strokeWidth: 2,
                              padding: EdgeInsets.all(6),
                              dashPattern: [5, 5, 5, 5],
                              color: Color(0xFFD0DBEA),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: Center(
                                  child: GestureDetector(
                                    child: uploadIcon(
                                      title: 'Add Cover Photo',
                                      subtitle: '(Up to 2 Mb)',
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    labelForm(label: 'Food Name'),
                    textfield(
                        controller: step1C.foodName,
                        hintText: 'Enter food name',
                        isRequired: 'Food name is required !'),
                    labelForm(label: 'Description'),
                    textarea(
                      minLines: 3,
                      controller: step1C.description,
                      hintText: 'Tell a little about your food',
                      isRequired: 'Description is required !',
                    ),
                    richLabel(
                        title1: 'Cooking Duration', title2: ' (in minutes)'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('<10', style: TextTypography.p1_primary),
                        Text('30', style: TextTypography.p1_primary),
                        Text('>60', style: TextTypography.p1_primary)
                      ],
                    ),
                    buildSlider(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 50),
                      child: Button(
                        disable: false,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.toNamed('/upload/step/2');
                          }
                        },
                        txtButton: 'Next',
                        color: AppColors.primary,
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
