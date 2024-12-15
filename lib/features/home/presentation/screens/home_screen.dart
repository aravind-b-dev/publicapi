import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../comments/presentation/screens/comment_list_screen.dart';
import '../../../posts/presentation/screens/post_list_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../providers/home_provider.dart';
import '../widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context,provider,child){
      return Scaffold(
        appBar: AppBar(
          title: Text(provider.selectedIndex == 0 ? 'My App' : 'Settings'),
          centerTitle: true,
        ),
        body: provider.selectedIndex == 0
            ? _buildHomeGrid(context)
            : const SettingsScreen(),

        bottomNavigationBar: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              currentIndex: provider.selectedIndex,
              onTap: provider.updateIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            );
          },
        ),
      );
    });
  }

  Widget _buildHomeGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      children: [
        FeatureCard(
          title: 'Posts',
          icon: Icons.article,
          color: Colors.blue,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostListScreen()),
          ),
        ),
        FeatureCard(
          title: 'Comments',
          icon: Icons.comment,
          color: Colors.green,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CommentListScreen()),
          ),
        ),
        FeatureCard(
          title: 'Albums',
          icon: Icons.photo_album,
          color: Colors.purple,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostListScreen()),
          ),
        ),
        FeatureCard(
          title: 'Photos',
          icon: Icons.photo,
          color: Colors.orange,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostListScreen()),
          ),
        ),
        FeatureCard(
          title: 'Todos',
          icon: Icons.check_circle,
          color: Colors.red,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostListScreen()),
          ),
        ),
        FeatureCard(
          title: 'Users',
          icon: Icons.people,
          color: Colors.teal,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostListScreen()),
          ),
        ),
      ],
    );
  }
}
