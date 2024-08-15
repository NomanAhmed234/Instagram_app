import 'package:flutter/material.dart';
import 'package:instagram_clone/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset('images/camera.jpg'),
        actions: [
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
          ),
          Image.asset('images/send.jpg'),
        ],
        elevation: 0,
        title: SizedBox(
            width: 105,
            height: 50,
            child: Image.asset('images/instagramlogo.png')),
        backgroundColor: Color(0xffafaf),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return PostWidget();
          }, childCount: 5))
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
