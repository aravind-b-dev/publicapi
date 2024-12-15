import 'package:get_it/get_it.dart';
import 'package:publicapiapp/features/comments/data/datasources/comment_remote_datasource.dart';
import 'package:publicapiapp/features/comments/data/repositories/comment_repository_impl.dart';
import 'package:publicapiapp/features/comments/domain/repositories/comment_repository.dart';
import 'package:publicapiapp/features/comments/presentation/providers/comment_provider.dart';
import '../../features/posts/data/datasources/post_remote_datasource.dart';
import '../../features/posts/data/repositories/post_repository_impl.dart';
import '../../features/posts/domain/repositories/post_repository.dart';
import '../../features/posts/presentation/providers/post_provider.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;  // sl = Service Locator

Future<void> init() async {
  // Api Client
  sl.registerLazySingleton(() => ApiClient());

  // Posts Feature
  initPosts();

  // Comments Feature
  initComments();

  // Other features...
}




// Initialize Posts Feature Dependencies
void initPosts() {
  // DataSource
  sl.registerLazySingleton(() => PostRemoteDataSource(sl()));
  // Repository
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(sl()),);
  // Provider
  sl.registerFactory(() => PostProvider(sl()));
}

// Initialize Comment Feature Dependencies
void initComments() {
  sl.registerLazySingleton(()=>CommentRemoteDataSource(sl()));
  sl.registerLazySingleton<CommentRepository>(()=>CommentRepositoryImpl(sl()));
  sl.registerFactory(()=>CommmentProvider(sl()));
}

void initAlbums() {
  // Albums dependencies
}