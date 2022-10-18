import 'dart:convert';
import 'dart:developer';
import 'package:api_rest/models/country_v3_model_model.dart';
import 'package:http/http.dart' as http;

class ServiceRequestApi {
  CountryV3Model countryModel = CountryV3Model();
  void getReqRespService() {
    //Parseamos Url
    //final url = Uri.parse('https://reqres.in/api/users?page=2#');
    final url = Uri.parse('https://restcountries.com/v3/all');

    http.get(url).then((response) {
      //rescatamos desde el Backend una respuesta

      final List<dynamic> bodyDecoded = jsonDecode(response.body);
      print(bodyDecoded);

      //Instance of Country
      final paises = bodyDecoded.map((e) {
        try {} catch (e) {
          log("$e");
          return CountryV3Model();
        }
      });

      ///[Instance of 'Country']
      final List<CountryV3Model?> listPaises = paises.toList();

      print(paises);
      print(listPaises.first?.name);

      for (var i = 0; i < listPaises.length; i++) {
        if (listPaises[i]?.name?.official != null) {
          print(listPaises[i]?.name?.official!);
        }
      }
    });
  }
}
