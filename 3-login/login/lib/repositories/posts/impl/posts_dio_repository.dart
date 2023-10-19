import 'dart:convert';

import 'package:login/model/post_model.dart';
import 'package:login/repositories/jsonplaceholder_custom_dio.dart';
import 'package:login/repositories/posts/post_repository.dart';
import 'package:dio/dio.dart';

class PostDioRepository implements PostRepository{

  @override
  Future<List<PostModel>> getPosts() async {

    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var res = await jsonPlaceHolderCustomDio.dio.get("/posts");
    if(res.statusCode == 200) {

      //transformando json para <List>
      //dio não precisa do JsonDecode
      return (res.data as List).map((e) => PostModel.fromJson(e)).toList();

    }

    // TODO: implement getPosts
    throw UnimplementedError();
  }



}