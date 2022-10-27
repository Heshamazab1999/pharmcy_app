import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/controller/base_controller.dart';
import 'package:pharmcy_app/enum/view_state.dart';
import 'package:pharmcy_app/models/model.dart';
import 'package:pharmcy_app/services/get_medicine.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends BaseController {
  final _services = GetMedicineServices();
  final loading = false.obs;
  final medicine = <MedicineModel>[].obs;
  final _isSearched = false.obs;
  final _categorySearch = <MedicineModel>[].obs;
  late ScrollController scrollController;
  final RefreshController refreshController = RefreshController();
  int num = 20;

  bool get isSearched => _isSearched.value;

  List<MedicineModel> get categorySearch => _categorySearch;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setSate(ViewState.busy);
    Future.delayed(const Duration(milliseconds: 300), () async {
      medicine.assignAll(await _services.getMedicines(num));
      setSate(ViewState.idle);
    });
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
              (e.b!)
                  .trim()
                  .toLowerCase()
                  .contains(string.trim().toLowerCase()) ||
              (e.c!)
                  .trim()
                  .toLowerCase()
                  .contains(string.trim().toLowerCase()) ||
              (e.l!).trim().toLowerCase().contains(string.trim().toLowerCase()))
          .toList());
    }
  }

  loadMore() async {
    if (medicine.isNotEmpty) {
      num += 20;
      medicine.assignAll(await _services.getMedicines(num));
      // loadData.addAll(medicine);
    } else {
      print("Loading");
    }
  }
}
