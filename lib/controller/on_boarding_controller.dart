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
    BoardingModel(
        label: "Get Reminders For Your\nMedications ",
        image: Images.onBoardImage2),
    BoardingModel(
        label: "Share Your Reports\nWith Your Doctors",
        image: Images.onBoardImage3),
  ];

  isLastFunction(int index) {
    if (index == labels.length - 1) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
  }

  isFirstFunction(int index) {
    if (index == labels.length - 2) {
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
