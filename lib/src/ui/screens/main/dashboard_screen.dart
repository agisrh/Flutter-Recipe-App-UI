import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';
import '../recipe/popular_recipe_sceen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> choice = ['All', 'Food', 'Drink'];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          SizedBox(height: 70),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchForm(context: context, redirect: true),
                Container(
                  padding: EdgeInsets.only(top: 24, bottom: 16),
                  child: Text('Category', style: TextTypography.mH2),
                ),
                buildFilter(choice),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: divider(),
          ),
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: AppColors.outline),
                      ),
                    ),
                    child: TabBar(
                      labelColor: AppColors.titleText,
                      unselectedLabelColor: AppColors.secondaryText,
                      indicatorColor: AppColors.primary,
                      indicatorWeight: 3,
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: <Widget>[Tab(text: "Popular"), Tab(text: "New")],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: TabBarView(
                        children: <Widget>[
                          PopularRecipeScreen(),
                          PopularRecipeScreen(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
