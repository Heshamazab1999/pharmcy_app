import 'package:get/get.dart';
import 'package:pharmcy_app/controller/base_controller.dart';
import 'package:pharmcy_app/enum/view_state.dart';
import 'package:pharmcy_app/models/model.dart';
import 'package:pharmcy_app/services/get_medicine.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends BaseController {
  final _services = GetMedicineServices();
  final loading = false.obs;
  final medicine = <MedicineModel>[].obs;
  final _isSearched = false.obs;
  final _categorySearch = <MedicineModel>[].obs;
  final RefreshController refreshController = RefreshController();
  int num = 20;
  final speechToText = SpeechToText().obs;
  final speechEnabled = false.obs;
  final lastWords = ''.obs;
  final Uri _url = Uri.parse('https://www.google.com/search?q=query+goes+here');

  bool get isSearched => _isSearched.value;

  List<MedicineModel> get categorySearch => _categorySearch;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setSate(ViewState.busy);
    medicine.assignAll(await _services.getMedicines(num));
    _initSpeech();
    setSate(ViewState.idle);
  }

  void _initSpeech() async {
    speechEnabled.value = await speechToText.value.initialize(options: []);
    update();
  }

  void startListening() async {
    await speechToText.value.listen(
      onResult: onSpeechResult,
      localeId: "AR",
    );
    update();
  }

  void stopListening() async {
    await speechToText.value.stop();
    update();
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    lastWords.value = result.recognizedWords;
    print(lastWords.value);
    onFilter(lastWords.value);
    update();
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
              (e.l!)
                  .trim()
                  .toLowerCase()
                  .contains(string.trim().toLowerCase()) ||
              (e.d!).trim().toLowerCase().contains(string.trim().toLowerCase()))
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

  Future<void> launchUrlMethod(String name) async {
    if (!await launchUrl(
        Uri.parse('https://www.google.com/search?q=$name+goes+here'))) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> launchUrlMedScape(String name) async {
    if (!await launchUrl(
        Uri.parse('https://search.medscape.com/search/?q=$name'))) {
      throw 'Could not launch $_url';
    }
  }
}
