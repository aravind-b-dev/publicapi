

import 'package:publicapiapp/features/comments/data/models/comment_model.dart';
import 'package:publicapiapp/features/comments/domain/entities/comment.dart';

abstract class CommentRepository{
  Future<List<Comment>> getComments();
  Future<CommentModel> getCommentById(int id);
}