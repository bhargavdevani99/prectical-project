import 'dart:async';

import 'package:demo_structure/config/app_colors.dart';
import 'package:demo_structure/config/image_path.dart';
import 'package:demo_structure/config/text_style.dart';
import 'package:demo_structure/splash/controller.dart';
import 'package:demo_structure/view/auth/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());

  // @override
  // void initState() {
  //   super.initState();
  //   controller.init();
  // }

  @override
  void initState() {
    Timer(
      const Duration(
        milliseconds: 2500,
      ),
      () {
        Get.to(
          () => const LoginScreen(),
          transition: Transition.cupertino,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Image.asset(ImagePath.splashImage),
      ),
    );
  }
}
