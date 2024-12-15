import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:publicapiapp/features/comments/presentation/providers/comment_provider.dart';

import 'comment_detail_screen.dart';

class CommentListScreen extends StatefulWidget {
  const CommentListScreen({super.key});

  @override
  State<CommentListScreen> createState() => _CommentListScreenState();
}

class _CommentListScreenState extends State<CommentListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CommmentProvider>().fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: Consumer<CommmentProvider>(builder: (context, provider, child) {
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

        if (provider.comments.isEmpty) {
          return const Center(
            child: Text("No Comments Available"),
          );
        }

        return ListView.builder(
            itemCount: provider.comments.length,
            itemBuilder: (context, inedx) {
              final comment = provider.comments[inedx];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    comment.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    comment.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            CommentDetailScreen(commentId: comment.id)),
                  ),
                ),
              );
            });
      }),
    );
  }
}
