import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/controller/on_boarding_controller.dart';
import 'package:pharmcy_app/helper/color_resources.dart';
import 'package:pharmcy_app/helper/styles.dart';
import 'package:pharmcy_app/models/on_boarding_model.dart';
import 'package:pharmcy_app/screens/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeScreenController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.boardController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      pageViewScreen(controller.labels[index]),
                  itemCount: controller.labels.length,
                  onPageChanged: (int index) {
                    controller.isFirstFunction(index);
                    controller.isLastFunction(index);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => controller.isFirst.value
                      ? GestureDetector(
                          onTap: () {
                            if (controller.isFirst.value) {
                              Get.to(() => HomeScreen());
                            }
                          },
                          child: Text("Skip",
                              style: avenirsMedium.copyWith(
                                  color: ColorResources.main_color,
                                  fontSize: 16)))
                      : IconButton(
                          onPressed: () {
                            controller.boardController.previousPage(
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: ColorResources.main_color,
                          ))),
                  // SmoothPageIndicator(
                  //     controller: controller.boardController, // PageController
                  //     count: controller.labels.length,
                  //     effect: const ScrollingDotsEffect(
                  //       dotColor: ColorResources.main_color,
                  //       dotHeight: 10,
                  //       activeDotColor: ColorResources.second_color,
                  //       dotWidth: 10,
                  //       spacing: 5,
                  //     ), // your preferred effect
                  //     onDotClicked: (index) {}),
                  // Obx(() => controller.isLast.value
                  //     ? GestureDetector(
                  //         onTap: () {
                  //           if (controller.isLast.value) {
                  //             Get.to(() => HomeScreen());
                  //
                  //           }
                  //         },
                  //         child: Text(
                  //           "Continue",
                  //           style: avenirsMedium.copyWith(
                  //               fontSize: 18, color: ColorResources.main_color),
                  //         ))
                  //     :
                  IconButton(
                      onPressed: () {
                        Get.to(() => HomeScreen());
                        // controller.boardController.nextPage(
                        //     duration: const Duration(milliseconds: 800),
                        //     curve: Curves.fastLinearToSlowEaseIn);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: ColorResources.main_color,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
