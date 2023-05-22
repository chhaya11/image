import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/app/model/home_model.dart';
import 'package:flutter_task/app/utils/common_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final scrollerController = ScrollController();

  RxList<Images> taskList = <Images>[].obs;
  int page = 1;
  RxBool isLoadingMore = false.obs;
  RxBool isLoading = false.obs;
  bool noMoreData = false;

  fetchInfo() async {
    if (!isLoadingMore.value) {
      isLoading.value = true;
    }
    final response = await http.get(
        Uri.parse('${ApiEndPoint.baseUrlWithParam}$page'),
        headers: {'Authorization': ApiEndPoint.token});
    isLoading.value = false;
    if (response.statusCode == 200) {
      final taskResponse = HomeModel.fromJson(json.decode(response.body));
      taskList.addAll(taskResponse.images ?? []);
    } else {
      if (page >= 3) {
        noMoreData = true;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchInfo();
    scrollerController.addListener(_scrollListener);
  }

  Future<void> _scrollListener() async {
    if (isLoadingMore.value || noMoreData) return;
    if (scrollerController.position.pixels + 50 >=
        scrollerController.position.maxScrollExtent) {
      isLoadingMore.value = true;
      page = page + 1;
      await fetchInfo();
      isLoadingMore.value = false;
    }
  }
}
