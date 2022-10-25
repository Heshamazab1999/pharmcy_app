import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/controller/base_controller.dart';
import 'package:pharmcy_app/enum/view_state.dart';
import 'package:pharmcy_app/helper/dimensions.dart';
import 'package:pharmcy_app/models/model.dart';
import 'package:pharmcy_app/services/get_medicine.dart';

class HomeController extends BaseController {
  final _services = GetMedicineServices();
  final loading = false.obs;
  final medicine = <MedicinesModel>[].obs;
  final loadData = <MedicinesModel>[].obs;
  final _isSearched = false.obs;
  final _categorySearch = <MedicinesModel>[].obs;
  late ScrollController scrollController;
  final isFirstLoadRunning = false.obs;
  final hasNextPage = true.obs;
  final isLoadMoreRunning = false.obs;
  int num = 1000;

  bool get isSearched => _isSearched.value;

  List<MedicinesModel> get categorySearch => _categorySearch;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setSate(ViewState.busy);
    medicine.assignAll(await _services.getMedicines(num));
    Future.delayed(const Duration(milliseconds: 300), () async {
      loadData.addAll(await _services.getMedicines(num));
      setSate(ViewState.idle);
    });
    scrollController = ScrollController()..addListener(_loadMore);
  }

  onFilter(String string) {
    _categorySearch.clear();
    if (string.isEmpty) {
      _categorySearch.clear();
      _isSearched.value = false;
    } else {
      _isSearched.value = true;
      _categorySearch.addAll(medicine
          .where((e) =>
              (e.pRODNAMEEN!)
                  .trim()
                  .toLowerCase()
                  .contains(string.trim().toLowerCase()) ||
              (e.aCTIVEINGREDIENT!)
                  .trim()
                  .toLowerCase()
                  .contains(string.trim().toLowerCase()) ||
              (e.pRICETAPE!)
                  .trim()
                  .toLowerCase()
                  .contains(string.trim().toLowerCase()))
          .toList());
    }
  }

  void _loadMore() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double delta = Dimensions.height * 0.20;
    if (maxScroll - currentScroll <= delta) {
      isLoadMoreRunning.value = true;
      num += 20;
      update();
      try {
        medicine.assignAll(await _services.getMedicines(num));
        if (medicine.isNotEmpty) {
          loadData.addAll(medicine);
          print(loadData.length);
        } else {
          hasNextPage.value = false;
          print(hasNextPage.value);
          update();
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      isLoadMoreRunning.value = false;
      print(isLoadMoreRunning.value);
      update();
    }
  }
}
