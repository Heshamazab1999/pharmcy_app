import 'package:get/get.dart';
import 'package:pharmcy_app/enum/view_state.dart';

class BaseController extends GetxController {
  final _state = ViewState.idle.obs;

  ViewState get state => _state.value;

  setSate(ViewState state) {
    _state.value = state;
  }
}
