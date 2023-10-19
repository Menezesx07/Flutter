import 'package:flutter/material.dart';
import 'package:login/model/comments_model.dart';
import 'package:login/repositories/comments/comments_http_repository.dart';
import '../../repositories/comments/impl/comments_dio_repository.dart';
import '../../repositories/comments/impl/comments_http_repository.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key, required this.postId});

  final int postId;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  CommentsRepository commentsRepository = CommentsDioRepository();
  var comments = <CommentsModel>[];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  
  getData() async {
    comments = await commentsRepository.returnComments(widget.postId);
    setState(() { });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comentarios do Post: ${widget.postId}")),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (_, index){

          var comment = comments[index];

          return Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: comments.length == 0
                     ? const Center(child: CircularProgressIndicator())
                     : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(comment.name.substring(0,6)),
                      Text(comment.email),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(comment.body),
                ],
              ),
            ));

        }),
      ),
    );
  }
}
