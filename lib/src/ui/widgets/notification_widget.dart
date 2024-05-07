import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/src/core/functions/network_image.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

Widget userActivity({
  required String name,
  required String activity,
  required String time,
  required String urlProfile,
  required String labelButton,
  bool disable = false,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    leading: Container(
      margin: const EdgeInsets.only(right: 5),
      height: 48,
      width: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: PNetworkImage(
          urlProfile,
          fit: BoxFit.cover,
        ),
      ),
    ),
    title: Text(name, style: TextTypography.mH3),
    subtitle: Text(
      '$activity ・ $time',
      style: TextTypography.category,
    ),
    trailing: ButtonSM(
      color: AppColors.primary,
      txtButton: labelButton,
      disable: disable,
      onPressed: () {},
    ),
  );
}

Widget postActivity({
  required String user1,
  required String user2,
  required String activity,
  required String time,
  required String urlProfile1,
  required String urlProfile2,
  required String urlPostImg,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    leading: ColumnSuper(
      innerDistance: -30.0,
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 45,
          width: 45,
          margin: const EdgeInsets.only(left: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: PNetworkImage(
              urlProfile1,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            border: Border.all(
              color: AppColors.bgColor,
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: PNetworkImage(
              urlProfile2,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    ),
    // leading: Container(
    //   height: 48,
    //   width: 48,
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(50),
    //     child: PNetworkImage(
    //       urlProfile1,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // ),
    title: Row(
      children: [
        Flexible(
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: user1,
                  style: TextTypography.mH3,
                ),
                const TextSpan(
                  text: ' and ',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.secondaryText,
                  ),
                ),
                TextSpan(
                  text: user2,
                  style: TextTypography.mH3,
                )
              ],
            ),
          ),
        ),
      ],
    ),
    subtitle: Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(
        '$activity ・ $time',
        style: TextTypography.category,
      ),
    ),
    trailing: SizedBox(
      height: 64,
      width: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: PNetworkImage(
          urlPostImg,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
