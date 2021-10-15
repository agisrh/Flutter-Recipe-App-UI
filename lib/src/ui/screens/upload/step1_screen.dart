import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/component_widget.dart';

class Step1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '1/',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleText,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '2',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.secondaryText,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: SizeConfig().deviceWidth(context) / 1.2,
                    height: SizeConfig().deviceHeight(context) / 4,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      strokeWidth: 2,
                      padding: EdgeInsets.all(6),
                      dashPattern: [5, 5, 5, 5],
                      color: Color(0xFFD0DBEA),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Food Name', style: TextTypography.mH2),
            ),
          ],
        ),
      ),
    );
  }
}
