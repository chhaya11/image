import 'package:flutter/material.dart';
import 'package:flutter_task/app/controller/splashController.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  final splashController =  Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome to the App'),
      ),
    );
  }
}
