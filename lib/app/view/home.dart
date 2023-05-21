import 'package:flutter/material.dart';
import 'package:flutter_task/app/controller/home_controller.dart';
import 'package:flutter_task/app/view/card.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Images' , style: TextStyle(color: Colors.blue),),
      ),
      body: Obx(()
        => GridView.builder(
          controller: homeController.scrollerController,
          itemCount:homeController.taskList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext ctx, index) {
              if (index < homeController.taskList.length) {
                return CardWidget(
                    dataModel: homeController.taskList[index]);
              }

            else{
            return const Center(child: CircularProgressIndicator());
            }
        }
            ),
      ),
    );
  }
}
