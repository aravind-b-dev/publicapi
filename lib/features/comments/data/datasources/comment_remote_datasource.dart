import 'package:publicapiapp/core/network/api_client.dart';
import 'package:publicapiapp/features/comments/data/models/comment_model.dart';

class CommentRemoteDataSource {
  final ApiClient apiClient;
  CommentRemoteDataSource(this.apiClient);

  Future<List<CommentModel>> getComment() async {
    final response = await apiClient.get('comments');

    ///method 1
    return (response as List)
        .map((json) => CommentModel.fromJson(json))
        .toList();


    ///method2
    /*
    List<CommentModel> comments = [];
    for (var item in response) {
      comments.add(CommentModel.fromJson(item));
    }
    return comments;
     */

    ///method 3
    /*
     return List.generate(response.length,
         (index) => CommentModel.fromJson(response[index])
      );
      */
  }
  
  
  Future<CommentModel> getCommentById(int id) async{
    final response = await apiClient.get('comments/$id');
    return CommentModel.fromJson(response);
  }
  
}
