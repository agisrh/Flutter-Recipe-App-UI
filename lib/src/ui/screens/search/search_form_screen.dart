import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/screens/recipe/popular_recipe_sceen.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class SearchFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> choice = ['Sushi', 'Sandwich', 'Seafood', 'Fried rice'];
    //final filterC = Get.put(SearchController());
    final SearchController filterC = Get.find();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Obx(
        () => ListView(
          children: [
            SizedBox(height: 20),
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
                  child: GestureDetector(
                    child: SvgPicture.asset(AssetIcons.filter),
                    onTap: () => bottomFilter(context),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: divider(),
            ),
            filterC.isFilter.value
                ? Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: PopularRecipeScreen(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      searchHistory(text: '${filterC.isFilter.value}'),
                      searchHistory(text: 'Salad'),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 24),
                        child: divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Search suggestions',
                              style: TextTypography.mH2),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: buildFilter(choice),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Future bottomFilter(BuildContext context) {
    List<String> choice = ['All', 'Food', 'Drink'];
    final filterCtrl = Get.put(SearchController());
    return Get.bottomSheet(
      Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Text('Add a Filter', style: TextTypography.mH2),
                ),
              ),
              Text('Category', style: TextTypography.mH2),
              buildFilter(choice),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 15),
                child: RichText(
                  text: TextSpan(
                    text: 'Cooking Duration',
                    style: TextTypography.mH2,
                    children: <TextSpan>[
                      TextSpan(
                        text: ' (in minutes)',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: AppColors.secondaryText,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('<10', style: TextTypography.p1_primary),
                  Text('30', style: TextTypography.p1_primary),
                  Text('>60', style: TextTypography.p1_primary)
                ],
              ),
              buildSlider(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonDefault(
                    width: SizeConfig().deviceWidth(context) / 2.5,
                    onPressed: () {
                      Get.back();
                    },
                    txtButton: 'Cancel',
                  ),
                  Button(
                    disable: false,
                    width: SizeConfig().deviceWidth(context) / 2.5,
                    onPressed: () {
                      filterCtrl.filter();
                      Get.back();
                    },
                    txtButton: 'Done',
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      elevation: 20.0,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
    );
  }
}
