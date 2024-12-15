import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> getPosts() async {
    try {
      return await remoteDataSource.getPosts();
    } catch (e) {
      throw Exception('Failed to get posts');
    }
  }

  @override
  Future<Post> getPostById(int id) async {
    try {
      return await remoteDataSource.getPostById(id);
    } catch (e) {
      throw Exception('Failed to get post details');
    }
  }
}