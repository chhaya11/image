import 'package:flutter/material.dart';
import 'package:flutter_task/app/controller/splashController.dart';
import 'package:flutter_task/app/utils/app_color.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome to the App',
          style: TextStyle(
              color: AppColors.blackText,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
    );
  }
}
