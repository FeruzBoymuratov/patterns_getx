import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_get_x/controllers/create_controller.dart';

class CreatePage extends StatefulWidget {
  static const String id = 'create_page';
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  final CreateController _createController = Get.put(CreateController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Stack(
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Title ni kiriting!'),
              Container(
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: _createController.titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Text('Body ni kiriting!'),
              Container(
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: _createController.bodyController,
                  decoration: const InputDecoration(
                    hintText: 'Body',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Text('User ID ni tanlang!'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/2),
                ),
                width: double.infinity,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _createController.idController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  child: const Text('OK', style: TextStyle(color: Colors.white),),
                  onPressed: _createController.apiCreatePost,
                ),
              ),
            ],
          ),
          _createController.isLoading() ?
          const Center(
              child: CircularProgressIndicator()) :
          const SizedBox.shrink(),
        ],
      ),
      ),
    );
  }
}