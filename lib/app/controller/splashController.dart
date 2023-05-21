import 'package:flutter_task/app/view/home.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5),
        ()=> Get.offAll(()=>Home()
    ));

  }
}