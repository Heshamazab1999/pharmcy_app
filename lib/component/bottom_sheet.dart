import 'package:flutter/material.dart';
import 'package:pharmcy_app/component/cashe_image.dart';
import 'package:pharmcy_app/helper/color_resources.dart';
import 'package:pharmcy_app/helper/dimensions.dart';
import 'package:pharmcy_app/helper/styles.dart';
import 'package:pharmcy_app/models/model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FixedBottomSheet extends StatelessWidget {
  const FixedBottomSheet({Key? key, this.medicine}) : super(key: key);
  final MedicinesModel? medicine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: Dimensions.width,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            ),
            child: LoadImage(
              image: medicine!.pHOTO,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: RichText(
            text: TextSpan(
                text: "PROD_NAME : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.pRODNAMEEN,
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.Black_COLOR),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: RichText(
            text: TextSpan(
                text: "ACTIVE_INGREDIENT : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.aCTIVEINGREDIENT,
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.Black_COLOR),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: RichText(
            text: TextSpan(
                text: "EXPIRE_WARNING : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.eXPIREWARNING.toString(),
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.Black_COLOR),
                  ),
                  TextSpan(
                      text: " Day",
                      style: avenirsMedium.copyWith(
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: ColorResources.Black_COLOR)),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: RichText(
            text: TextSpan(
                text: "EXPIRE_WARNING_DAY : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.eXPIREWARNINGDAY.toString(),
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.Black_COLOR),
                  ),
                  TextSpan(
                      text: " Day",
                      style: avenirsMedium.copyWith(
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: ColorResources.Black_COLOR)),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: RichText(
            text: TextSpan(
                text: "CONSUMER_PRICE : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.cONSUMERPRICE.toString(),
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.Black_COLOR),
                  ),
                  TextSpan(
                    text: " LE ",
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        color: ColorResources.Black_COLOR),
                  )
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: RichText(
            text: TextSpan(
                text: "PRICE_TAPE : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.pRICETAPE,
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.Black_COLOR),
                  ),
                  TextSpan(
                    text: " LE",
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.Black_COLOR),
                  ),
                ]),
          ),
        ),
        Center(
          child: QrImage(
            data: medicine!.bARCODEU,
            version: QrVersions.auto,
            size: 100.0,
          ),
        )
      ],
    );
  }
}
