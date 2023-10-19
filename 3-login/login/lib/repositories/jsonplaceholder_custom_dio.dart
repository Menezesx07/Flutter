import 'package:dio/dio.dart';

class JsonPlaceHolderCustomDio {

  final _dio = Dio();

  //retornando a função privada
  Dio get dio => _dio;

  //url base do servidor
  JsonPlaceHolderCustomDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com/";
  }

}