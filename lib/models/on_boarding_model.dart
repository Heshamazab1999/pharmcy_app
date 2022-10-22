import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmcy_app/helper/color_resources.dart';
import 'package:pharmcy_app/helper/styles.dart';

class BoardingModel {
  final String? label;
  final String? image;

  BoardingModel({this.label, this.image});
}

Widget pageViewScreen(BoardingModel model) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Lottie.asset(model.image!)),
        SizedBox(
          height: 50,
        ),
        Text(
          model.label!,
          style: avenirsMedium.copyWith(
            color: ColorResources.main_color,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
