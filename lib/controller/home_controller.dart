import 'package:get/get.dart';
import 'package:pharmcy_app/controller/base_controller.dart';
import 'package:pharmcy_app/models/medicine_model.dart';
import 'package:pharmcy_app/services/get_medicine.dart';

class HomeController extends BaseController {
  final _services = GetMedicineServices();
  final medicine = <MedicineModel>[].obs;

  final _isSearched = false.obs;
  final _categorySearch = <MedicineModel>[].obs;

  bool get isSearched => _isSearched.value;

  List<MedicineModel> get categorySearch => _categorySearch;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    medicine.assignAll(await _services.getMedicine());
  }

  onFilter(String string) {
    _categorySearch.clear();
    if (string.isEmpty) {
      _categorySearch.clear();
      _isSearched.value = false;
    } else {
      _isSearched.value = true;
      _categorySearch.addAll(medicine
          .where((e) => (e.name!)
              .trim()
              .toLowerCase()
              .contains(string.trim().toLowerCase()))
          .toList());
    }
  }
}
