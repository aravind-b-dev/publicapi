import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'core/di/injection_container.dart';
import 'features/comments/presentation/providers/comment_provider.dart';
import 'features/home/presentation/providers/home_provider.dart';
import 'features/posts/presentation/providers/post_provider.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<PostProvider>(),),
        ChangeNotifierProvider(create: (_) => sl<CommmentProvider>(),),
        ChangeNotifierProvider(create: (_) => HomeProvider(),),
      ],
      child: const MyApp(),
    ),
  );
}
