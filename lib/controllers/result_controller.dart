import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PageController pageController;

  int MAX_SECTION_INDEX = 5;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  RxBool get isPreviousBtnEnabled {
    bool enabled = sectionIndex.value != 0;
    return enabled.obs;
  }

  RxBool get isNextBtnEnabled {
    bool enabled = sectionIndex.value < MAX_SECTION_INDEX;
    return enabled.obs;
  }

  RxString get previousTitle {
    String title2;
    title2 = "";
    switch (sectionIndex.value) {
      case 0:
        title2 = " ";
        break;
      case 1:
        title2 = "Main";
        break;
      case 2:
        title2 = "Description";
        break;
      case 3:
        title2 = "Work";
        break;
      case 4:
        title2 = "Relationship";
        break;
      case 5:
        title2 = "Hobby";
        break;
      default:
    }
    return title2.obs;
  }

  RxString get nextTitle {
    String title2;
    title2 = "";
    switch (sectionIndex.value) {
      case 0:
        title2 = "Description";
        break;
      case 1:
        title2 = "Work";
        break;
      case 2:
        title2 = "Relationship";
        break;
      case 3:
        title2 = "Hobby";
        break;
      case 4:
        title2 = "Suggestions";
        break;
      case 5:
        title2 = " ";
        break;
      default:
    }
    return title2.obs;
  }

  RxInt sectionIndex = 0.obs;

  onPreviousBtnClicked() {
    sectionIndex.value = sectionIndex.value - 1;

    pageController.previousPage(
        duration: Duration(milliseconds: 250), curve: Curves.ease);
  }

  onNextBtnClicked() {
    sectionIndex.value = sectionIndex.value + 1;

    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.ease);
  }
}
