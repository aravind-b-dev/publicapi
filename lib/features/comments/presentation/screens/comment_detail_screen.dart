import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:publicapiapp/features/comments/presentation/providers/comment_provider.dart';

class CommentDetailScreen extends StatefulWidget {
  final int commentId;
  const CommentDetailScreen({super.key, required this.commentId});

  @override
  State<CommentDetailScreen> createState() => _CommentDetailScreenState();
}

class _CommentDetailScreenState extends State<CommentDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CommmentProvider>().fetchCommentDetails(widget.commentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Details"),
      ),
      body: Consumer<CommmentProvider>(builder: (context, provider, child) {
        final comment = provider.selectedComment;

        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (provider.error != null) {
          return Center(
            child: Text(provider.error!),
          );
        }

        if (comment == null) {
          return const Center(
            child: Text("Comment not found"),
          );
        }

        return Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text("Email : ${comment.email}",
                  style: const TextStyle(fontSize: 16, color: Colors.black45)),
              const SizedBox(height: 16),
              Text(comment.body, style: const TextStyle(fontSize: 16)),
            ],
          ),
        );
      }),
    );
  }
}
