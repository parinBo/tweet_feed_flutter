import 'package:flutter/material.dart';
import 'package:tweet_feed/screens/feed_screen.dart';
import 'package:tweet_feed/screens/form_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.feed),
              ),
            ]),
          ),
        ),
        body: const TabBarView(children: [
          FormScreen(),
          Column(children: [FeedScreen()],)
        ]),
      ),
    );
  }
}
