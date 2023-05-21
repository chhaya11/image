import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/app/model/home_model.dart';
import 'package:flutter_task/app/utils/common_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{

  final scrollerController  = ScrollController();
  RxList<Images> taskList = <Images>[].obs;
  int page = 1;
  bool isLoadingMore = false;
  RxBool isLoading = false.obs;

  fetchInfo() async {
  final response = await http.get(Uri.parse('https://staging.codefruits.in/gwbit/?page=1&page=$page'),
  headers: {
    'Authorization' : ApiEndPoint.token
  });
  isLoading.value = true;
  if(response.statusCode == 200) {
    final taskResponse = HomeModel.fromJson(json.decode(response.body));
    isLoading.value = false;
    //taskList.clear();
    taskList.addAll(taskResponse.images ?? []);
    taskList = taskList + (taskResponse.images ?? []);
  }else{
    print("Something bad");
  }

  }

  @override
  void onInit() {
    super.onInit();
    fetchInfo();
    scrollerController.addListener(_scrollListner);
  }

  Future<void> _scrollListner()async{
    if(isLoadingMore) return;
    if(scrollerController.position.pixels == scrollerController.position.maxScrollExtent){
      isLoadingMore = true;
      page = page + 1;
      await fetchInfo();
      print('call');
      isLoadingMore = false;
    }else{
      print('dont call');
    }
    //print('scroll listener is working');
  }
}