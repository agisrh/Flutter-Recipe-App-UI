import 'package:flutter/material.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';
import '../recipe/popular_recipe_sceen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> choice = ['All', 'Food', 'Drink'];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          const SizedBox(height: 70),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchForm(context: context, redirect: true),
                Container(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: const Text('Category', style: TextTypography.mH2),
                ),
                buildFilter(choice),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: divider(),
          ),
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: AppColors.outline),
                      ),
                    ),
                    child: const TabBar(
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
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: const TabBarView(
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
