import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/component/card_home_screen.dart';
import 'package:pharmcy_app/component/place_holder.dart';
import 'package:pharmcy_app/component/shape.dart';
import 'package:pharmcy_app/component/text_field.dart';
import 'package:pharmcy_app/controller/home_controller.dart';
import 'package:pharmcy_app/helper/color_resources.dart';
import 'package:pharmcy_app/helper/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(Dimensions.width, Dimensions.height * 0.2),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                painter: Shape(),
                size: Size(Dimensions.width, Dimensions.height * 0.2),
              ),
              FixedTextField(
                label: "Search By name ....",
                type: TextInputType.name,
                function: (v) {
                  controller.onFilter(v);
                },
              ),
            ],
          ),
        ),
        body: Obx(
              () =>
          controller.medicine.length == 0
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.height * 0.1),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Products",
                    style: TextStyle(
                        color: ColorResources.Black_COLOR, fontSize: 18),
                  ),
                ),
                if ((controller.isSearched
                    ? controller.categorySearch.length
                    : controller.medicine.length) ==
                    0)
                  EmptyPlaceholder(
                    message: "Not Found Category",
                  )
                else
                  GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.isSearched
                          ? controller.categorySearch.length
                          : controller.medicine.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (_, index) =>
                          CardScreen(
                              medicine: controller.isSearched
                                  ? controller
                                  .categorySearch[index]
                                  : controller.medicine[index] ,
                          ))
              ],
            ),
          ),
        ));
  }
}
