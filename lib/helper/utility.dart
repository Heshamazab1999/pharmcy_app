import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/helper/color_resources.dart';

class Utility {
  static showBottomSheet(BuildContext context, Widget widget) {
    Get.bottomSheet(
      Container(
        height: Get.height,
        decoration: const BoxDecoration(
            color: ColorResources.WHITE_COL0R,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50))),
        child: widget,
      ),
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      isDismissible: true,
    );
  }
}
