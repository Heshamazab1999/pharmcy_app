import 'package:flutter/material.dart';
import 'package:pharmcy_app/component/cashe_image.dart';
import 'package:pharmcy_app/helper/color_resources.dart';
import 'package:pharmcy_app/helper/dimensions.dart';
import 'package:pharmcy_app/helper/styles.dart';
import 'package:pharmcy_app/models/model.dart';

class FixedBottomSheet extends StatelessWidget {
  const FixedBottomSheet({Key? key, this.medicine, this.onTap})
      : super(key: key);
  final MedicineModel? medicine;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: Dimensions.width,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              child: LoadImage(
                image: medicine!.i!,
              ),
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
                    text: medicine!.d,
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
                text: "PROD_NAME_AR : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.c,
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
                    text: medicine!.b,
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
                    text: medicine!.h.toString(),
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
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 10,
        //   ),
        //   child: RichText(
        //     text: TextSpan(
        //         text: "EXPIRE_WARNING_DAY : ",
        //         style: avenirsMedium.copyWith(
        //             fontSize: Dimensions.FONT_SIZE_DEFAULT,
        //             color: ColorResources.RED_COLOR),
        //         children: [
        //           TextSpan(
        //             text: medicine!.g.toString(),
        //             style: avenirsMedium.copyWith(
        //                 fontSize: Dimensions.FONT_SIZE_LARGE,
        //                 color: ColorResources.Black_COLOR),
        //           ),
        //           TextSpan(
        //               text: " Day",
        //               style: avenirsMedium.copyWith(
        //                   fontSize: Dimensions.FONT_SIZE_DEFAULT,
        //                   color: ColorResources.Black_COLOR)),
        //         ]),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: RichText(
            text: TextSpan(
                text: "PRICE : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.f.toString(),
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
                    text: medicine!.k,
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: RichText(
            text: TextSpan(
                text: "INDICATIONS : ",
                style: avenirsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: ColorResources.RED_COLOR),
                children: [
                  TextSpan(
                    text: medicine!.l,
                    style: avenirsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.Black_COLOR),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
