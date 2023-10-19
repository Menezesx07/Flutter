import "dart:convert";
import "package:http/http.dart" as http;
import "package:login/model/post_model.dart";
import 'package:login/repositories/posts/post_repository.dart';

class PostHttpRepository implements PostRepository{
  
  @override
  Future<List<PostModel>> getPosts() async {
    
    var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(res.statusCode == 200) {

      var jsonPosts = jsonDecode(res.body);
      //transformando json para <List>
      return (jsonPosts as List).map((e) => PostModel.fromJson(e)).toList();
    }

    //caso dê algum erro de status code, retorna uma lista vazia
    return [];
    
  }
  
}