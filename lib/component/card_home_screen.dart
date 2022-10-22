import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pharmcy_app/component/cashe_image.dart';
import 'package:pharmcy_app/helper/dimensions.dart';
import 'package:pharmcy_app/models/medicine_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key, this.medicine}) : super(key: key);
  final MedicineModel? medicine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.1,
              child: LoadImage(image: medicine!.image!),
            ),
          ),
          AutoSizeText(medicine!.name!),
          AutoSizeText("Type:${medicine!.type!}"),
          AutoSizeText("price:${medicine!.price!}Le"),
          AutoSizeText(medicine!.strength!),
          AutoSizeText(medicine!.similars!),
          AutoSizeText(medicine!.alternative!),
          AutoSizeText(medicine!.material!),
        ],
      ),
    );
  }
}
