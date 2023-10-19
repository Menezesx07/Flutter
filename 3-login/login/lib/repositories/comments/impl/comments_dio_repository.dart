import 'dart:convert';
import 'package:login/model/comments_model.dart';
import "package:http/http.dart" as http;
import 'package:login/repositories/comments/comments_http_repository.dart';
import 'package:dio/dio.dart';
import 'package:login/repositories/jsonplaceholder_custom_dio.dart';

class CommentsDioRepository implements CommentsRepository{

  @override
  Future<List<CommentsModel>> returnComments(int postId) async {

    //pegando a url base do repositorio
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var res = await jsonPlaceHolderCustomDio.dio.get("/posts/$postId/comments");

    if(res.statusCode == 200) {
      //passando cada item para o "destructuring"
      return (res.data as List).map((e) => CommentsModel.fromJson(e)).toList();
    }
    //caso der erro, retorna um array vazio para não quebrar o codigo
    return [];
  }

}