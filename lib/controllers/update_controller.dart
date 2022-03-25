
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';
import '../pages/home_page.dart';
import '../services/http_service.dart';

class UpdateController{
  var titleInput = ''.obs;
  var bodyInput = ''.obs;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var isLoading = false.obs;

  Future apiUpdatePost(BuildContext context) async {
    isLoading(true);
    Post post = Post(title: titleController.text, body: bodyController.text, userId: Random().nextInt(10), id: Random().nextInt(10));
    var response = Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post));
    if(response != null){
      Get.offAll(const HomePage());
    }
    isLoading(false);
  }
}