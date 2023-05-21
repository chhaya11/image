import 'package:flutter/material.dart';
import 'package:flutter_task/app/model/home_model.dart';
import 'package:flutter_task/app/utils/app_color.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class CardWidget extends StatelessWidget {
  Images dataModel;

  CardWidget({Key? key, required this.dataModel}) : super(key: key);
     final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
      ),
        child: Column(children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataModel.wbi?.length,
                    itemBuilder: (BuildContext ctx , positionIndex){
                    return Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                dataModel.wbi?[positionIndex].wikfile?.toString() ?? ""))),
                      );
                      }
                    ),
                Positioned(
                    top: 8,
                    left: 8,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            scale : 0.1,
                            dataModel.user?.userprofile?.userimg ?? ""),
                      ),
                      const SizedBox(width: 16,),
                      Text(dataModel.user?.username ?? "" , style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),)
                    ],)),
               ]),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 6 , left: 10 , right: 10 , bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on ,
                      color: AppColors.pinkColor,
                    size: 20.0),
                    Text(dataModel.location ?? "" ,
                      style: const TextStyle(
                      fontWeight: FontWeight.w600,
                        fontSize: 14
                      ),),
                  ],
                ),
               const Icon(Icons.person_add_alt_1_sharp ,
              color: AppColors.pinkColor,
              size: 20.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0 , left: 0 , right: 10 , bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('400k likes',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    color: AppColors.greyText
                  ),),
                Text('40k Comments',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: AppColors.greyText
                  ),),
              ],
            ),
          ),
           ] ),
          ),
    );
  }
}
