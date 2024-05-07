import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/functions/network_image.dart';
import 'package:recipe_app/src/core/models/helper_model.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/component_widget.dart';

class DetailReciperScreen extends StatelessWidget {
  const DetailReciperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeModel data = Get.arguments;
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
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              background: PNetworkImage(
                data.imgCover,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(45),
              child: Transform.translate(
                offset: const Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(data.title, style: TextTypography.mH2),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(data.category, style: TextTypography.category),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Icon(
                              Octicons.primitive_dot,
                              color: AppColors.secondaryText,
                              size: 10,
                            ),
                          ),
                          Text(data.duration, style: TextTypography.category),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: PNetworkImage(
                                    data.imgAuthor,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(data.author, style: TextTypography.mH3)
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: AppColors.primary,
                                child: SvgPicture.asset(AssetIcons.heart),
                              ),
                              const SizedBox(width: 8),
                              const Text("273 Likes", style: TextTypography.mH3)
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: const Divider(thickness: 1),
                      ),
                      const Text('Description', style: TextTypography.mH3),
                      Container(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: const Text(
                          "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
                          style: TextTypography.sP2,
                        ),
                      ),
                      const Divider(thickness: 1),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Text('Ingredients',
                            style: TextTypography.mH3),
                      ),
                      Expanded(
                        child: ListView.builder(
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          itemCount: ingredients.length,
                          padding: const EdgeInsets.only(bottom: 16),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: listItem(label: ingredients[index]),
                            );
                          },
                        ),
                      ),
                      const Divider(thickness: 1),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Text('Steps', style: TextTypography.mH3),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          itemCount: ingredients.length,
                          padding: const EdgeInsets.only(top: 16),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 25),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  stepNumber(number: index + 1),
                                  const SizedBox(width: 16),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                                          style: TextTypography.mP2,
                                        ),
                                        Container(
                                          height: 155,
                                          margin:
                                              const EdgeInsets.only(top: 16),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: PNetworkImage(
                                              data.imgCover,
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
