import 'package:coachini/controller/ControllView.dart';
import 'package:coachini/pages/home.dart';
import 'package:coachini/services/firebase.-service.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseService());
    Get.lazyPut(() => ControlView());
    Get.lazyPut(() => HomePage());
  }
}
