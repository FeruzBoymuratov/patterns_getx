import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';

class CreateController{
  var isLoading = false.obs;

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var idController = TextEditingController();

  apiCreatePost() async {
    isLoading(true);
    var title = titleController.value.text.trim().toString();
    var body = bodyController.value.text.trim().toString();
    var id = int.parse(idController.value.text.toString());
    Post post = Post(title: title, body: body, userId: id, id: id);
    var response = Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print(await response);

    isLoading(false);
    Get.back(result: response);
    //Navigator.pop(context, response);
  }

}