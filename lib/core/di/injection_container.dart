import 'package:get_it/get_it.dart';
import 'package:publicapiapp/features/comments/data/datasources/comment_remote_datasource.dart';
import 'package:publicapiapp/features/comments/data/repositories/comment_repository_impl.dart';
import 'package:publicapiapp/features/comments/domain/repositories/comment_repository.dart';
import 'package:publicapiapp/features/comments/presentation/providers/comment_provider.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;  // sl = Service Locator

Future<void> init() async {
  // Api Client
  sl.registerLazySingleton(() => ApiClient());

  // Comments
  initComments();

}

// Initialize Comment Feature Dependencies
void initComments() {
  // DataSource
  sl.registerLazySingleton(()=>CommentRemoteDataSource(sl()));
  // Repository
  sl.registerLazySingleton<CommentRepository>(()=>CommentRepositoryImpl(sl()));
  // Provider
  sl.registerFactory(()=>CommmentProvider(sl()));
}

