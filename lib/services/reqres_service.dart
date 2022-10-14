import 'dart:convert';
import 'package:api_rest/models/models.dart';
import 'package:http/http.dart' as http;

class ServiceRequestApi {
  void getReqRespService() {
    //Parseamos Url
    final url = Uri.parse('https://reqres.in/api/users?page=2#');

    print('awesome: Ya tengo mi Api!!');
    print(url);
    http.get(url).then((response) {
      print(response);

      final reqRes = PersonsModel.fromJson(jsonDecode(response.body));
      print(reqRes);
    });
  }
}
