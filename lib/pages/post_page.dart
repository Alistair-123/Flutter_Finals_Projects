import 'package:flutter/material.dart';
import '../models/post.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  int? postId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Post? post = ModalRoute.of(context)!.settings.arguments as Post?;
    if (post != null) {
      postId = post.id;
      titleController.text = post.title;
      contentController.text = post.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postId != null ? 'Edit Post' : 'New Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
              ),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                validator: (value) => value!.isEmpty ? 'Enter content' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newPost = Post(
                      title: titleController.text, // Use titleController
                      content: contentController.text, // Use contentController
                    );
                    Navigator.pop(
                        context, newPost); // Pass new post back to HomePage
                  }
                },
                child: Text(postId != null ? 'Update Post' : 'Create Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
