
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../controllers/home_controller.dart';
import '../models/post_model.dart';

class DetailPage extends StatefulWidget {
  static const String id = 'details_page';

  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  String title = '', body = '';

  final _controller = Get.put(HomeController());

  Post post = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiPostCall(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'), elevation: 0.3, centerTitle: true,),
      backgroundColor: Colors.deepPurple.shade500,
      body: Container(
        margin: EdgeInsets.all(20),
        child: postId(),
      ),
    );
  }

  Widget postId(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(post.title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          Text(post.body,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          Text(post.id.toString(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
