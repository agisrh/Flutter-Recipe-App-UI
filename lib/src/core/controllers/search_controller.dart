import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final search = TextEditingController();

  @override
  void onInit() {
    searchListener();
    super.onInit();
  }

  var hasTxtSearch = false.obs;
  void searchListener() {
    search.addListener(() {
      // check if search form is not empty
      if (search.text.isNotEmpty) {
        hasTxtSearch.value = true;
      } else {
        hasTxtSearch.value = false;
      }
    });
  }

  void clearForm() => search.clear();

  var isFilter = false.obs;
  void filter() => isFilter.value = true;
}
