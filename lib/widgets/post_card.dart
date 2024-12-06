import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Function(int) onDelete;
  final Function(Post) onEdit;

  PostCard({required this.post, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => onEdit(post),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () =>
                  onDelete(post.id!), // Fixed passing id for delete
            ),
          ],
        ),
      ),
    );
  }
}
