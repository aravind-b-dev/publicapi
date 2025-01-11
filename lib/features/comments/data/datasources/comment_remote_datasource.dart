import 'package:publicapiapp/core/network/api_client.dart';
import 'package:publicapiapp/features/comments/data/models/comment_model.dart';

class CommentRemoteDataSource {
  final ApiClient apiClient;
  CommentRemoteDataSource(this.apiClient);

  Future<List<CommentModel>> getComment() async {
    final response = await apiClient.get('comments');

    return (response as List)
        .map((json) => CommentModel.fromJson(json))
        .toList();

  }
  
  
  Future<CommentModel> getCommentById(int id) async{
    final response = await apiClient.get('comments/$id');
    return CommentModel.fromJson(response);
  }
  
}
