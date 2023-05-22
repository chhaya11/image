import 'package:flutter/material.dart';
import 'package:flutter_task/app/controller/home_controller.dart';
import 'package:flutter_task/app/view/card.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Images',
          style: TextStyle(
              color: AppColors.blackText, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => homeController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: GridView.builder(
                      controller: homeController.scrollerController,
                      itemCount: homeController.taskList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 300,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 6),
                      itemBuilder: (BuildContext ctx, index) {
                        return CardWidget(
                            dataModel: homeController.taskList[index]);
                      }),
                ),
              ),
      ),
    );
  }
}
