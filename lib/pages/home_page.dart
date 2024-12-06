import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/post_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [
    Post(id: 1, title: 'Post 1', content: 'Content of post 1'),
    Post(id: 2, title: 'Post 2', content: 'Content of post 2'),
  ];

  void deletePost(int id) {
    setState(() {
      posts.removeWhere((post) => post.id == id);
    });
  }

  void editPost(Post post) {
    Navigator.pushNamed(context, '/post', arguments: post).then((value) {
      if (value != null && value is Post) {
        setState(() {
          posts[posts.indexWhere((p) => p.id == post.id)] = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Home'), centerTitle: true),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(
            post: posts[index],
            onDelete: deletePost,
            onEdit: editPost,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/post').then((newPost) {
            if (newPost != null && newPost is Post) {
              setState(() {
                posts.add(newPost); // Add new post to list
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
