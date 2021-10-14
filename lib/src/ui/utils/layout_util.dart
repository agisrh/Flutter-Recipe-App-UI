import 'package:flutter/material.dart';

class SizeConfig {
  double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
