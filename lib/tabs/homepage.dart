import 'package:flutter/material.dart';
import 'package:you_you/youcard.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Persons.posts.length,
      itemBuilder: (context, index) {
        final post = Persons.posts[index];
        return YouCard(
          name: post['name'],
          imageUrl: post['imageUrl'],
          age: post['age'],
          location: post['location'],
          isFav: post['isFav'],
        );
      },
    );
  }}