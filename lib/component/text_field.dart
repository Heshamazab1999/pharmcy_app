import 'package:flutter/material.dart';
import 'package:pharmcy_app/helper/color_resources.dart';
import 'package:pharmcy_app/helper/dimensions.dart';
import 'package:pharmcy_app/helper/styles.dart';
import 'package:show_up_animation/show_up_animation.dart';

class FixedTextField extends StatelessWidget {
  const FixedTextField(
      {Key? key, this.label, this.function, this.type, this.errorLabel})
      : super(key: key);
  final String? label;
  final Function(String)? function;
  final TextInputType? type;
  final String? errorLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
            keyboardType: type,
            onChanged: function,
            showCursor: true,
            cursorColor: const Color(0xFF8E8E8E),
            decoration: InputDecoration(
              prefixIcon:
                  const Icon(Icons.search, color: ColorResources.Disable_COL0R),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: InputBorder.none,
              hintText: label!,
              hintStyle: avenirsMedium.copyWith(
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  color: ColorResources.Disable_COL0R),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  borderSide: const BorderSide(color: Color(0xFFF5F5F5))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  borderSide: const BorderSide(color: Color(0xFFF5F5F5))),
            )),
      ),
    );
  }
}
