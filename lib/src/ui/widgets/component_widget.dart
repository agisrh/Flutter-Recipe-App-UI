import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

Widget richTextLink(
    {required String title,
    required String linkText,
    required GestureTapCallback onTap}) {
  return RichText(
    text: TextSpan(
      text: title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
        color: AppColors.mainText,
      ),
      children: <TextSpan>[
        TextSpan(
          text: ' $linkText',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
            color: AppColors.primary,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              onTap();
            },
        )
      ],
    ),
  );
}

Widget itemContain({required String label, required bool isOk}) {
  return Row(
    children: [
      isOk
          ? SvgPicture.asset(AssetIcons.checkGreen)
          : SvgPicture.asset(AssetIcons.checkGrey),
      const SizedBox(width: 8),
      Text(
        label,
        style: TextStyle(
            color: isOk ? AppColors.mainText : AppColors.secondaryText),
      ),
    ],
  );
}

Widget listItem({required String label}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(AssetIcons.checkGreen),
      const SizedBox(width: 8),
      Text(
        label,
        style: TextTypography.mP2,
      ),
    ],
  );
}

Widget titleGreeting({required String title, required String subtitle}) {
  return Column(
    children: [
      const SizedBox(height: 50),
      Text(
        title,
        style: TextTypography.mH1,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          subtitle,
          style: TextTypography.sP2,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 32),
    ],
  );
}

Future dialog(
    {required String title,
    required String subtitle,
    required Widget icon,
    required String txtButton,
    required GestureTapCallback onPressed}) {
  return Get.defaultDialog(
    title: '',
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    content: Column(
      children: [
        icon,
        Container(
          padding: const EdgeInsets.only(top: 32, bottom: 8),
          child: Text(
            title,
            style: TextTypography.mH1,
          ),
        ),
        Text(
          subtitle,
          style: TextTypography.mP2,
          textAlign: TextAlign.center,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: Button(
            onPressed: () {
              onPressed();
            },
            txtButton: txtButton,
            color: AppColors.primary,
          ),
        ),
      ],
    ),
  );
}

Widget buildFilter(List choice) {
  final controller = Get.put(OtherController());
  return Obx(
    () => Wrap(
      children: List<Widget>.generate(
        choice.length,
        (int index) {
          return Container(
            margin: const EdgeInsets.only(right: 12, top: 16),
            child: ChoiceChip(
              pressElevation: 0,
              showCheckmark: false,
              side: BorderSide.none,
              backgroundColor: AppColors.form,
              selectedColor: AppColors.primary,
              labelStyle: controller.choice.value == index
                  ? const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700)
                  : const TextStyle(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              label: Text(choice[index]),
              selected: controller.choice.value == index,
              onSelected: (bool selected) {
                controller.setChoice(index);
              },
            ),
          );
        },
      ).toList(),
    ),
  );
}

Widget buildSlider() {
  final filterC = Get.put(OtherController());
  return SliderTheme(
    data: SliderThemeData(
      trackShape: CustomTrackShape(),
    ),
    child: Obx(
      () => Slider(
        value: filterC.sliderValue.value,
        min: 0,
        max: 60,
        activeColor: AppColors.primary,
        inactiveColor: AppColors.form,
        label: filterC.sliderValue.value.round().toString(),
        onChanged: (double value) {
          filterC.setSlider(value);
        },
      ),
    ),
  );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    const double trackHeight = 3;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

Widget divider() {
  return Container(color: AppColors.form, height: 8);
}

Widget searchHistory({required String text}) {
  return ListTile(
    dense: true,
    leading: const Icon(Entypo.clock, color: AppColors.secondaryText),
    title: Text(text, style: TextTypography.mH2_500),
    trailing: SvgPicture.asset(AssetIcons.arrowUpward),
  );
}

Widget uploadIcon({required String title, required String subtitle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SvgPicture.asset(AssetIcons.image),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.titleText,
          ),
        ),
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.secondaryText,
        ),
      )
    ],
  );
}

Widget pagination({required String currentPage, required String nextPage}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () => Get.back(),
        child: const Text(
          'Cancel',
          style: TextStyle(
            fontSize: 17,
            color: AppColors.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      RichText(
        text: TextSpan(
          text: '$currentPage/',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.titleText,
          ),
          children: <TextSpan>[
            TextSpan(
              text: nextPage,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.secondaryText,
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget stepNumber({required int number}) {
  return CircleAvatar(
    radius: 15,
    backgroundColor: AppColors.mainText,
    child: Text(
      number.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  );
}
