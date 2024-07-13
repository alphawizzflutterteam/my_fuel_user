import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';

class LoginController extends AppBaseController {
  Rx<int> changeIndex = 0.obs;

  void changeIndexMethod(int index) {
    changeIndex.value = index;
  }
}
