import 'dart:convert';

import 'package:login/model/comments_model.dart';
import "package:http/http.dart" as http;
import 'package:login/repositories/comments/comments_http_repository.dart';

class CommentsHttpRepository implements CommentsRepository{
  
  @override
  Future<List<CommentsModel>> returnComments(int postId) async {
    
    var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if(res.statusCode == 200) {

      var jsonComments = jsonDecode(res.body);
      //passando cada item para o "destructur'ing"
      return (jsonComments as List).map((e) => CommentsModel.fromJson(e)).toList();
    }
    //caso der erro, retorna um array vazio para não quebrar o codigo
    return [];
  }
  
}