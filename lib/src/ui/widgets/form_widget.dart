import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';

Widget textfieldIcon({
  String hintText = '',
  String isRequired = '',
  required Widget icon,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 15, color: AppColors.secondaryText),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: icon,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.secondary, width: 1),
            ),
          ),
          validator: (value) {
            if (isRequired != '') {
              if (value!.isEmpty) {
                return isRequired;
              }
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget textfieldPassword({
  String hintText = '',
  String isRequired = '',
  required Widget icon,
  required bool obsecure,
  required TextEditingController controller,
  required GestureTapCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 15, color: AppColors.secondaryText),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: icon,
            ),
            suffixIcon: InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Icon(
                  obsecure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 24,
                  color: AppColors.secondaryText,
                ),
              ),
              onTap: () {
                onTap();
              },
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.secondary, width: 1),
            ),
          ),
          validator: (value) {
            if (isRequired != '') {
              if (value!.isEmpty) {
                return isRequired;
              }
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget passwordRegister({
  String hintText = '',
  String isRequired = '',
  required Widget icon,
  required bool obsecure,
  required TextEditingController controller,
  required GestureTapCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 15, color: AppColors.secondaryText),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: icon,
            ),
            suffixIcon: InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Icon(
                  obsecure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 24,
                  color: AppColors.secondaryText,
                ),
              ),
              onTap: () {
                onTap();
              },
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.secondary, width: 1),
            ),
          ),
          validator: (value) {
            if (isRequired != '') {
              if (value!.isEmpty) {
                return isRequired;
              }
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget textfieldOTP({
  required BuildContext context,
  required int length,
}) {
  return PinCodeTextField(
    appContext: context,
    backgroundColor: Colors.white,
    length: length,
    animationType: AnimationType.fade,
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(20),
      fieldHeight: 72,
      fieldWidth: 72,
      selectedColor: AppColors.primary,
      activeColor: AppColors.outline,
      inactiveColor: AppColors.outline,
    ),
    cursorColor: Colors.black,
    animationDuration: const Duration(milliseconds: 300),
    keyboardType: TextInputType.number,
    onCompleted: (v) {},
    onChanged: (value) {},
  );
}

Widget textfield({
  String hintText = '',
  String isRequired = '',
  required TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
      hintStyle: const TextStyle(fontSize: 15, color: AppColors.secondaryText),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: AppColors.outline, width: 1),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: AppColors.outline, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        borderSide: BorderSide(color: AppColors.secondary, width: 1),
      ),
    ),
    validator: (value) {
      if (isRequired != '') {
        if (value!.isEmpty) {
          return isRequired;
        }
      }
      return null;
    },
  );
}

Widget searchForm({required BuildContext context, bool redirect = false}) {
  final searchC = Get.put(SearchFormController());
  return Obx(
    () => TextFormField(
      onTap: () {
        if (redirect) {
          Get.toNamed('/search/form');
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      controller: searchC.search,
      cursorColor: AppColors.mainText,
      style: const TextStyle(fontSize: 15, color: AppColors.mainText),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.form,
        hintText: "Search",
        hintStyle: const TextStyle(
          fontSize: 15,
          color: AppColors.secondaryText,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          child: SvgPicture.asset(AssetIcons.search),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          child: GestureDetector(
            child: Icon(
              MfgLabs.cancel_circled,
              color: searchC.hasTxtSearch.value
                  ? AppColors.mainText
                  : Colors.transparent,
              size: 20,
            ),
            onTap: () => searchC.clearForm(),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: AppColors.form, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: AppColors.form, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: AppColors.form, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: AppColors.form, width: 1),
        ),
      ),
    ),
  );
}

Widget textarea({
  String hintText = '',
  String isRequired = '',
  required TextEditingController controller,
  required int minLines,
}) {
  return TextFormField(
    minLines: minLines,
    keyboardType: TextInputType.multiline,
    maxLines: null,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 15, color: AppColors.secondaryText),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.outline, width: 1),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.outline, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.secondary, width: 1),
      ),
    ),
    validator: (value) {
      if (isRequired != '') {
        if (value!.isEmpty) {
          return isRequired;
        }
      }
      return null;
    },
  );
}

Widget labelForm({required String label}) {
  return Container(
    margin: const EdgeInsets.only(top: 24, bottom: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(label, style: TextTypography.mH2),
    ),
  );
}

Widget richLabel({required String title1, required String title2}) {
  return Container(
    padding: const EdgeInsets.only(top: 30, bottom: 15),
    child: RichText(
      text: TextSpan(
        text: title1,
        style: TextTypography.mH2,
        children: <TextSpan>[
          TextSpan(
            text: title2,
            style: const TextStyle(
              fontSize: 15.0,
              color: AppColors.secondaryText,
            ),
          )
        ],
      ),
    ),
  );
}
