import 'package:flutter/material.dart';
import 'package:recipe_app/src/core/functions/network_image.dart';
import 'package:recipe_app/src/ui/screens/user/user_recipe_screen.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 30, top: 70),
              child: const Icon(
                Icons.share,
                color: AppColors.mainText,
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.only(top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const PNetworkImage(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: const Text('Elena Shelby', style: TextTypography.mH2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              countCategory(count: '32', label: 'Recipe'),
              countCategory(count: '782', label: 'Following'),
              countCategory(count: '1.287', label: 'Followers'),
            ],
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 52, right: 52, top: 32),
          //   child: Button(
          //     disable: false,
          //     onPressed: () {},
          //     txtButton: 'Follow',
          //     color: AppColors.primary,
          //   ),
          // ),
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
                      tabs: <Widget>[Tab(text: "Recipes"), Tab(text: "Liked")],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: const TabBarView(
                        children: <Widget>[
                          UserRecipeScreen(),
                          UserRecipeScreen(),
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

Widget countCategory({required String count, required String label}) {
  return Column(
    children: [
      Text(count, style: TextTypography.mH2),
      Text(label, style: TextTypography.category),
    ],
  );
}
