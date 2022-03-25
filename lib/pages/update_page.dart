
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_get_x/controllers/update_controller.dart';

class UpdatePage extends StatefulWidget {
  static const String id = "update_page";
  String title, body;
  UpdatePage({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final UpdateController _updateController = Get.put(UpdateController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateController.titleInput.value = widget.title;
    _updateController.bodyInput.value = widget.body;
    _updateController.titleController.text = _updateController.titleInput.value;
    _updateController.bodyController.text = _updateController.bodyInput.value;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                const Center(
                  child: Text('Title', style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(_updateController.titleInput.value,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _updateController.titleController,
                          decoration: const InputDecoration(
                            label: Text("Title"),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: (){
                          _updateController.titleInput.value = _updateController.titleController.text;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Center(
                  child: Text('Body', style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 5,),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Text(_updateController.bodyInput.value)),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLength: null,
                          controller: _updateController.bodyController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: (){
                          _updateController.bodyInput.value = _updateController.bodyController.text;
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _updateController.apiUpdatePost(context);
                    },
                    child: const Text("SUBMIT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _updateController.isLoading() ?
          const Center(child: CircularProgressIndicator(),) :
          const SizedBox.shrink(),
        ],
      ),
      ),
    );
  }
}