import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/controller/base_controller.dart';
import 'package:pharmcy_app/helper/images.dart';
import 'package:pharmcy_app/models/on_boarding_model.dart';

class WelcomeScreenController extends BaseController {
  final boardController = PageController();
  final isLast = false.obs;
  final isFirst = true.obs;
  final List<BoardingModel> labels = [
    // BoardingModel(
    //     label: "Get information\n about your Medicine ",
    //     image: Images.onBoardImage2),
    BoardingModel(
        label: "Search for your drugs\n by different ways ",
        image: Images.covidImage),
  ];

  isLastFunction(int index) {
    if (index == labels.length ) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
  }

  isFirstFunction(int index) {
    if (index == labels.length - 1) {
      isFirst.value = true;
    } else {
      isFirst.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    isFirstFunction(0);
  }
}
