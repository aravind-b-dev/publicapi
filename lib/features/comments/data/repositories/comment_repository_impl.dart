

import 'package:publicapiapp/features/comments/data/datasources/comment_remote_datasource.dart';
import 'package:publicapiapp/features/comments/data/models/comment_model.dart';
import 'package:publicapiapp/features/comments/domain/entities/comment.dart';
import 'package:publicapiapp/features/comments/domain/repositories/comment_repository.dart';

class CommentRepositoryImpl extends CommentRepository{
  final CommentRemoteDataSource remoteDataSource;
  CommentRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Comment>> getComments()async{
    try{
      return await remoteDataSource.getComment();
    }catch(e){
      throw Exception('Failed to get comments');
    }
  }


  @override
  Future<CommentModel> getCommentById(int id) async {
    try{
      return await remoteDataSource.getCommentById(id);
    }catch(e){
      throw Exception('Failed to get comment details');
    }
  }
}