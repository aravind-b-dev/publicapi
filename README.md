
The data flow works like this:

.......


PostListScreen loads and requests data from PostProvider

PostProvider gets data from Repository

Repository gets data from DataSource

DataSource makes API call and returns PostModels

Data flows back up through each layer

PostProvider updates state

UI rebuilds with new data


1.Dependency Injection (DI) with GetIt
   ....................................
   
 injection_container.dart
   
      final sl = GetIt.instance;
   
      Future<void> init() async {

            // Register dependencies
            sl.registerLazySingleton(() => ApiClient());

            sl.registerLazySingleton(() => PostRemoteDataSource(sl()));

            sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(sl()));

            sl.registerFactory(() => PostProvider(sl()));
      }

Why DI?

Makes dependencies easy to swap (e.g., changing API client)

Makes testing easier (can inject mock services)

Centralizes dependency management

Reduces coupling between components



2.Provider Pattern
....................................


main.dart

      MultiProvider(

         providers: [
            ChangeNotifierProvider(create: (_) => sl<PostProvider>()),
         ],
         child: const MyApp(),
      )



Why Provider?

State management across the app

Rebuilds only widgets that need updates

Separates business logic from UI



3.Complete Data Flow:
....................................

When user opens PostListScreen:

Step 1: UI requests data


      void initState() {
         context.read<PostProvider>().fetchPosts();
      }

// Step 2: Provider handles request

      class PostProvider extends ChangeNotifier {

            Future<void> fetchPosts() async {

            _isLoading = true;

            notifyListeners();  // UI shows loading

          try {
            _posts = await repository.getPosts();
          } catch (e) {
            _error = e.toString();
          }
    
             _isLoading = false;
             notifyListeners();  // UI updates
         }
      }

// Step 3: Repository processes request

      class PostRepositoryImpl implements PostRepository {
         Future<List<Post>> getPosts() async {
            return await remoteDataSource.getPosts();
         }
      }

// Step 4: DataSource makes API call


      class PostRemoteDataSource {
            Future<List<PostModel>> getPosts() async {
               final response = await apiClient.get('posts');
               return (response as List)
               .map((json) => PostModel.fromJson(json))
               .toList();
            }
         }


// Step 5: UI updates through Consumer

      Consumer<PostProvider>(
            builder: (context, provider, child) {
               if (provider.isLoading) {
                  return CircularProgressIndicator();
               }
            return ListView.builder(...);
         },
      )



4.Layer-by-Layer Explanation:
....................................

 a) Presentation Layer:

   Screens (UI)
   
   Providers (State Management)
   
   Widgets (Reusable UI components)

b) Domain Layer:

   Entities (Core business objects)
   
   Repository Interfaces (Contracts)

c) Data Layer:

   Models (Data structure)
   
   DataSources (API calls)
   
   Repository Implementations


Benefits of this Architecture:


Separation of Concerns:
.......................

   UI only handles display
   
   Provider manages state
   
   Repository handles data operations
   
   DataSource handles external communication


Maintainability:
...............

   Each component has a single responsibility
   
   Easy to modify individual parts
   
   Clear data flow


Testability:
............

   Can mock any component
   
   Clear interfaces
   
   Isolated components


