import 'dart:convert';
import 'dart:developer';
import 'package:api_rest/models/models.dart';
import 'package:http/http.dart' as http;

class ServiceRequestApi {
  PersonsModel personsModel = PersonsModel();
  void getReqRespService() {
    //Parseamos Url
    final url = Uri.parse('https://reqres.in/api/users?page=2#');

    print('awesome: Ya tengo mi Api!!');
    print(url);
    http.get(url).then((response) {
      //rescatamos desde el Backend una respuesta
      print(response.body);

      final personsModel = PersonsModel.fromJson(jsonDecode(response.body));
      print(personsModel.data);
      print(personsModel.data!.first.email);
      personsModel.data?.forEach((element) {
        print(element.firstName);
      });
    }).catchError((err) {
      log('$err');
    });
  }
}
