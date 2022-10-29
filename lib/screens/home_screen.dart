import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/component/card_home_screen.dart';
import 'package:pharmcy_app/component/place_holder.dart';
import 'package:pharmcy_app/component/shimmer_widget.dart';
import 'package:pharmcy_app/component/text_field.dart';
import 'package:pharmcy_app/controller/home_controller.dart';
import 'package:pharmcy_app/enum/view_state.dart';
import 'package:pharmcy_app/helper/color_resources.dart';
import 'package:pharmcy_app/helper/dimensions.dart';
import 'package:pharmcy_app/helper/images.dart';
import 'package:pharmcy_app/helper/utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../component/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        body: Obx(
      () => controller.state == ViewState.busy
          ? const ShimmerWidget()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimensions.height * 0.1),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Medicine Store",
                        style: TextStyle(
                            color: ColorResources.Black_COLOR,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // const Icon(
                      //   Icons.shopping_cart_outlined,
                      //   color: ColorResources.CARD_SHADOW_COLOR,
                      // ),
                      SizedBox(width: Dimensions.width * 0.05),
                      Container(
                          clipBehavior: Clip.antiAlias,
                          height: 40,
                          width: 40,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            Images.logo,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(width: Dimensions.width * 0.05),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("How are you felling today ? ",
                        style: TextStyle(
                            color: ColorResources.Disable_COL0R,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(height: Dimensions.height * 0.03),
                  FixedTextField(
                    label: "Search By any information",
                    type: TextInputType.name,
                    function: (v) {
                      controller.onFilter(v);
                    },
                  ),
                  if ((controller.isSearched
                          ? controller.categorySearch.length
                          : controller.medicine.length) ==
                      0)
                    const EmptyPlaceholder(
                      message: "Not Found Category",
                    )
                  else
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SmartRefresher(
                        controller: controller.refreshController,
                        enablePullUp: true,
                        enablePullDown: true,
                        onLoading: () async {
                          await controller.loadMore();
                          // controller.refreshController.loadComplete();
                          // controller.refreshController.requestLoading();
                        },
                        child: GridView.builder(
                          // controller: controller.scrollController,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.isSearched
                              ? controller.categorySearch.length
                              : controller.medicine.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Utility.showBottomSheet(
                                    context,
                                    FixedBottomSheet(
                                      medicine: controller.isSearched
                                          ? controller.categorySearch[index]
                                          : controller.medicine[index],
                                    ));
                              },
                              child: CardScreen(
                                medicine: controller.isSearched
                                    ? controller.categorySearch[index]
                                    : controller.medicine[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
    ));
  }
}
