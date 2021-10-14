import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class SearchFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> choice = ['Sushi', 'Sandwich', 'Seafood', 'Fried rice'];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          SizedBox(height: 70),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  child: Icon(Icons.arrow_back_ios, size: 20),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              Flexible(
                child: searchForm(context: context),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: SvgPicture.asset(AssetIcons.filter),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: divider(),
          ),
          searchHistory(text: 'Pancakes'),
          searchHistory(text: 'Salad'),
          Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: divider(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Search suggestions', style: TextTypography.mH2),
            ),
          ),
          buildFilter(choice),
        ],
      ),
    );
  }
}
