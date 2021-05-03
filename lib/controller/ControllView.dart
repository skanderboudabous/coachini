import 'package:coachini/pages/admin.dart';
import 'package:coachini/pages/home.dart';
import 'package:coachini/pages/loading.dart';
import 'package:coachini/pages/login.dart';
import 'package:coachini/services/firebase.-service.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<FirebaseService> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<FirebaseService>().userId == null)
          ? LoginPage()
          : LoadingPage();
    });
  }
}
