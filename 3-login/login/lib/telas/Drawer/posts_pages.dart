import 'package:flutter/material.dart';
import 'package:login/model/post_model.dart';
import 'package:login/repositories/posts/impl/posts_dio_repository.dart';
import 'package:login/repositories/posts/post_repository.dart';
import 'package:login/telas/Drawer/comments_page.dart';
import '../../repositories/posts/impl/posts_http_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  PostRepository postRepository = PostDioRepository();
  //lista baseada no PostModel
  var posts = <PostModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    posts = await postRepository.getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: ListView.builder(
          itemCount: posts.length,
        // _ é o context, como não vai ser usado futuramente, pode ser só o _
        itemBuilder: (_, index) {
            var post = posts[index];
            //title e outros é baseado no model que tem essa variavel
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CommentsPage(postId: post.id)));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(post.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text(post.body, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                          ],
                        ))),
              ),
            );
        },

      ),
    );
  }
}
