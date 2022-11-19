import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pharmcy_app/component/cashe_image.dart';
import 'package:pharmcy_app/helper/color_resources.dart';
import 'package:pharmcy_app/helper/dimensions.dart';
import 'package:pharmcy_app/helper/styles.dart';
import 'package:pharmcy_app/models/model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    Key? key,
    this.medicine,
  }) : super(key: key);
  final MedicineModel? medicine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_TEN),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 0,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.RADIUS_SIZE_TEN),
                    topRight: Radius.circular(Dimensions.RADIUS_SIZE_TEN)),
                child: LoadImage(image: medicine!.i)
                // "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: AutoSizeText(
              medicine!.d!,
              maxLines: 1,
              style: avenirsMedium.copyWith(
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: ColorResources.Black_COLOR),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: AutoSizeText(
              "${medicine!.c!}",
              style: avenirsMedium.copyWith(
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: ColorResources.Black_COLOR),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: AutoSizeText(
              medicine!.b!,
              maxLines: 1,
              style: avenirsMedium.copyWith(
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: ColorResources.Black_COLOR),
            ),
          ),
          // AutoSizeText(
          //   "Price_Tape:${medicine!.j!}",
          //   style: avenirsMedium.copyWith(
          //       fontSize: Dimensions.RADIUS_SIZE_TEN,
          //       color: ColorResources.Black_COLOR),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                  maxLines: 1,
                  text: TextSpan(
                      text: "Price : ",
                      style: avenirsMedium.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: ColorResources.Black_COLOR),
                      children: [
                        TextSpan(
                          text: " ${double.parse(medicine!.k??"0").round()}",
                          style: avenirsMedium.copyWith(
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                              color: ColorResources.RED_COLOR),
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
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(4),
          //   child: AutoSizeText(
          //     "INDICATIONS ${medicine!.l!}",
          //     maxLines: 1,
          //     style: avenirsMedium.copyWith(
          //         fontSize: Dimensions.FONT_SIZE_LARGE,
          //         color: ColorResources.Black_COLOR),
          //   ),
          // ),
        ],
      ),
    );
  }
}
