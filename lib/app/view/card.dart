import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/model/home_model.dart';
import 'package:flutter_task/app/utils/app_color.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/home_controller.dart';

class CardWidget extends StatelessWidget {
  final Images dataModel;

  CardWidget({Key? key, required this.dataModel}) : super(key: key);

  final homeController = Get.put(HomeController());
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(children: [
        Expanded(
          child: Stack(children: [
            PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: dataModel.wbi?.length,
                itemBuilder: (BuildContext ctx, positionIndex) {
                  return CachedNetworkImage(
                    imageUrl:
                        dataModel.wbi?[positionIndex].wikfile?.toString() ?? "",
                    imageBuilder: (ctx, provider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: provider)),
                    ),
                  );
                }),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: (dataModel.wbi?.length ?? 0) <= 1
                  ? const SizedBox.shrink()
                  : Center(
                      child: SmoothPageIndicator(
                        controller: pageController, // PageController
                        count: (dataModel.wbi?.length ?? 0),
                        effect: WormEffect(
                            dotHeight: 5,
                            dotWidth: 5,
                            activeDotColor: AppColors.whiteText,
                            dotColor:
                                Colors.grey.shade400), // your preferred effect
                      ),
                    ),
            ),
            Positioned(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
               AppColors.gradientStartColor,
               AppColors.gradientEndColor,
                Color(0x4D000000),
                Colors.transparent,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        scale: 1, dataModel.user?.userprofile?.userimg ?? ""),
                    radius: 12,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    dataModel.user?.username ?? "",
                    style: const TextStyle(
                        color: AppColors.whiteText,
                        fontWeight: FontWeight.w600,
                        fontSize: 11),
                  )
                ],
              ),
            )),
          ]),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 6, left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  dataModel.user?.userprofile?.mapicon == null
                      ? const Icon(Icons.location_on,
                          color: AppColors.pinkColor, size: 20.0)
                      : dataModel.user?.userprofile?.mapicon ?? "",
                  Text(
                    dataModel.location ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ],
              ),
              const Icon(Icons.person_add_alt_1_sharp,
                  color: AppColors.pinkColor, size: 20.0),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 17, right: 10, bottom: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${(dataModel.timageid?.isNotEmpty == true ? ((dataModel.timageid?[0] as Map<String, dynamic>)["totallikes"] ?? "0") : "0")} likes',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: AppColors.greyText),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                '40k Comments',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: AppColors.greyText),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
