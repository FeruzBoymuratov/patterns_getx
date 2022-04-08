
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:patterns_get_x/controllers/home_controller.dart';
import 'package:patterns_get_x/pages/create_page.dart';
import 'package:patterns_get_x/pages/update_page.dart';

import '../models/post_model.dart';
import 'create_page.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GetX', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        onPressed: (){
          Get.to(const CreatePage());
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() => Stack(
        children: [
          ListView.builder(
            itemCount: _controller.items.length,
            itemBuilder: (ctx, index){
              return GestureDetector(
                onTap: (){

                  Get.to(DetailPage(), arguments: _controller.items[index]);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                },
                child: Container(
                    key: const Key('item'),
                    child: itemOfPost(_controller.items[index])),
              );
            },
          ),
          _controller.isLoading() ?
          const Center(
            child: CircularProgressIndicator(),
          ) : const SizedBox.shrink(),
        ],
      ),
      ),
    );
  }

  Widget itemOfPost(Post post){
    return Slidable(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toUpperCase(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 5,),
            Text(post.body),
          ],
        ),
      ),
      startActionPane: ActionPane(
        extentRatio: 0.25,
        children: [
          Flexible(
            child: Container(
              color: Colors.indigo,
              child: IconButton(
                icon: const Icon(Icons.edit, semanticLabel: 'Update',),
                color: Colors.white,
                onPressed: (){
                  Get.to(UpdatePage(title: post.title, body: post.body,));
                },
              ),
            ),
          ),
        ],
        motion: const DrawerMotion(),
      ),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        children: [
          Flexible(
            child: Container(
              color: Colors.red,
              child: IconButton(
                icon: const Icon(Icons.delete, semanticLabel: 'Delete',),
                color: Colors.white,
                onPressed: (){
                  _controller.apiPostDelete(post);
                },
              ),
            ),
          ),
        ],
        motion: const DrawerMotion(),
      ),
    );
  }
}