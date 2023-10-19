import 'dart:convert';

import 'package:login/model/via_cep_model.dart';
import "package:http/http.dart" as http;

class ViaCepRepository {

  Future<ViaCepModel> getCep(String cep) async {

    var res = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if(res.statusCode == 200) {
      var json =  jsonDecode(res.body);
      return ViaCepModel.fromJson(json);
    }

    return ViaCepModel();

  }


}