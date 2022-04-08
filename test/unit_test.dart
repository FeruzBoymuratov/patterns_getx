import 'package:flutter_test/flutter_test.dart';
import 'package:patterns_get_x/services/http_service.dart';

void main(){
  test("Post is not null", () async{
    var response = await Network.GET(Network.API_POST, Network.paramsEmpty());
    expect(response, isNotNull);
  });
}