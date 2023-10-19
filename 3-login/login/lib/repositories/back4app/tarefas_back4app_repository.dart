
import 'package:dio/dio.dart';
import 'package:login/model/tarefas_back4app_model.dart';

class TarefasBack4AppRepository {

  var _dio = Dio();

  //criando a base do Rest com o url necessario
  //ao executar qualquer função com o _dio, ele vai cair nessa função
  //e anexar esses itens
  TarefasBack4AppRepository () {
     _dio = Dio();
    //passando os cabeçarios necessarios do back4app
    _dio.options.headers["X-Parse-Application-Id"] = "m6RFt3k9iFNP7dAuYLyeuJcc74wTc6Pvg9qO2M6K";
    _dio.options.headers["X-Parse-REST-API-Key"] = "KCeEt8RCQMew7vZdq55QyyB4gdbnCA0Ikeol3ihh";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes/";
  }

  Future<TarefasBack4AppModel> getTask(bool naoConcluidas) async {

    var _teste = TarefasBack4AppModel([]);
    var url = "/Tarefas/";
    if(naoConcluidas) {
      // contra barra para não da erro por conta das "" do check conflitar com as "" pra formar a string
      url = "$url?where={\"check\":true}";
    }
    //metodo Get do dio
    var res = await _dio.get(url);
    _teste = TarefasBack4AppModel.fromJson(res.data);
    var tarefaBack4App = _teste.tarefas[0];
    return TarefasBack4AppModel.fromJson(res.data);
  }

  Future<void> save (TarefaBack4AppModel tarefaBack4AppModel) async {

   try {
     //metodo post do Dio
     var res =  await _dio.post("/Tarefas", data: tarefaBack4AppModel.toJsonEndPoint());
   } catch (e) {
     throw e;
   }
  }

  Future<void> put(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      //metodo put do Dio
      //passando o id do objeto que veio por parametro, acessando o id direto do construtor
      var res =  await _dio.put("/Tarefas/${tarefaBack4AppModel.objectId}", data: tarefaBack4AppModel.toJsonEndPoint());
    } catch (e) {
      throw e;
    }
  }


}
