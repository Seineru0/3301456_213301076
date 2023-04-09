import 'package:flutter/material.dart';
import 'package:you_you/youcard.dart';

class FavTab extends StatefulWidget {
  const FavTab({Key? key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  List<Map<String, dynamic>> favPosts = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favPosts.length,
      itemBuilder: (context, index) {
        final post = favPosts[index];

        return YouCard(
          name: post['name'],
          imageUrl: post['imageUrl'],
          age: post['age'],
          location: post['location'],
          isFav: post['isFav'],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updateFavPosts();
  }

  void updateFavPosts() {
    setState(() {
      favPosts = Persons.posts.where((post) => post['isFav']).toList();
    });
  }
}