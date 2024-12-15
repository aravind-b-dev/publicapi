import '../../../../core/network/api_client.dart';
import '../models/post_model.dart';

class PostRemoteDataSource {
  final ApiClient apiClient;

  PostRemoteDataSource(this.apiClient);

  Future<List<PostModel>> getPosts() async {
    final response = await apiClient.get('posts');
    return (response as List)
        .map((json) => PostModel.fromJson(json))
        .toList();
  }

  Future<PostModel> getPostById(int id) async {
    final response = await apiClient.get('posts/$id');
    return PostModel.fromJson(response);
  }
}
