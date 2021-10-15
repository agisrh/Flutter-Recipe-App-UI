import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/functions/network_image.dart';
import 'package:recipe_app/src/core/models/helper_model.dart';
import 'package:recipe_app/src/ui/utils/assets_util.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/component_widget.dart';

class DetailReciperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipeModel _data = Get.arguments;
    List<String> ingredients = ['4 Eggs', '1/2 Butter', '1 Liter Water'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            elevation: 0,
            snap: true,
            floating: true,
            stretch: true,
            backgroundColor: Colors.grey.shade50,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: PNetworkImage(
                _data.imgCover,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: Transform.translate(
                offset: Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height * 0.90,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_data.title, style: TextTypography.mH2),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(_data.category, style: TextTypography.category),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Octicons.primitive_dot,
                              color: AppColors.secondaryText,
                              size: 10,
                            ),
                          ),
                          Text(_data.duration, style: TextTypography.category),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: PNetworkImage(
                                    _data.imgAuthor,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(_data.author, style: TextTypography.mH3)
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: AppColors.primary,
                                child: SvgPicture.asset(AssetIcons.heart),
                              ),
                              SizedBox(width: 8),
                              Text("273 Likes", style: TextTypography.mH3)
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(thickness: 1),
                      ),
                      Text('Description', style: TextTypography.mH3),
                      Container(
                        padding: EdgeInsets.only(top: 8, bottom: 16),
                        child: Text(
                          "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
                          style: TextTypography.sP2,
                        ),
                      ),
                      Divider(thickness: 1),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text('Ingredients', style: TextTypography.mH3),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            itemCount: ingredients.length,
                            padding: EdgeInsets.only(bottom: 16),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: listItem(label: ingredients[index]),
                              );
                            },
                          ),
                        ),
                      ),
                      Divider(thickness: 1),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text('Steps', style: TextTypography.mH3),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: ListView.builder(
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            itemCount: ingredients.length,
                            padding: EdgeInsets.only(top: 16),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 25),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: AppColors.mainText,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Text(
                                              'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                                              style: TextTypography.mP2,
                                            ),
                                          ),
                                          Container(
                                            height: 155,
                                            margin: EdgeInsets.only(top: 16),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: PNetworkImage(
                                                _data.imgCover,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
