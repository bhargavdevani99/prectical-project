import 'dart:async';

import 'package:demo_structure/view/botom_bar/bottom_bar.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  init() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const BottomBar());
    });
  }
}
