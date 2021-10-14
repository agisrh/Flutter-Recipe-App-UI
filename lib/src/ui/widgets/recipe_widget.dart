import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:recipe_app/src/core/functions/network_image.dart';
import 'package:recipe_app/src/core/models/recipe_model.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';

class RecipeWidget extends StatelessWidget {
  final RecipeModel data;

  RecipeWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 31,
                width: 31,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: PNetworkImage(
                    data.imgAuthor,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  data.author,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mainText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 151,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: PNetworkImage(
                    data.imgCover,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10.0,
                  top: 10.0,
                  child: new ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 35,
                        width: 35,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            data.favorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                data.favorite ? Colors.redAccent : Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(top: 16, bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(data.title, style: TextTypography.mH2),
              ),
            ),
            onTap: () => Get.toNamed('/recipe/detail', arguments: data),
          ),
          Row(
            children: [
              Text(data.category, style: TextTypography.category),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  Octicons.primitive_dot,
                  color: AppColors.secondaryText,
                  size: 10,
                ),
              ),
              Text(data.duration, style: TextTypography.category)
            ],
          )
        ],
      ),
    );
  }
}
