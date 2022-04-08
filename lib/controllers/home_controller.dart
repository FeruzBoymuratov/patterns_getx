import '../models/post_model.dart';
import '../services/http_service.dart';
import 'package:get/get.dart';

class HomeController{
  var isLoading = false.obs;
  var items = <Post>[].obs;

  Future apiPostList() async{
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      items.value = Network.parsePostList(response);
    }else{
      items.value = [];
    }
  }

  void apiPostDelete(Post post) async {
    isLoading(true);
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }
    isLoading(false);
  }

  void apiPostCall(Post post) async {
    isLoading(true);
    var response = await Network.GET(Network.API_POST + post.id.toString(), Network.paramsEmpty());
    if(response != null){
      print(response);
    }
    isLoading(false);
  }
}