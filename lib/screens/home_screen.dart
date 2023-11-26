import 'package:flutter/material.dart';
import 'package:tweet_feed/screens/enddrawer_screen.dart';
import 'package:tweet_feed/screens/notification_screen.dart';
import 'package:tweet_feed/screens/tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeScaffordKey = GlobalKey<ScaffoldState>();
  final _homeformKey = GlobalKey<FormState>();
  final _homeAddInputController = TextEditingController();

  @override
  void dispose() {
    _homeAddInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeScaffordKey,
      body: Column(
        children: [
          Row(
            children: [textHeadWidget(), notiWidget(), peopleWidget()],
          ),
          const Expanded(child: TabScreen()),
        ],
      ),
      endDrawer: const EndDrawerScreen(),
    );
  }

  void _printLatestValue() {
    final text = _homeAddInputController.text;
    print('Second text field: $text (${text.characters.length})');
  }

  Widget peopleWidget() {
    return IconButton(
        onPressed: () {
          _homeScaffordKey.currentState?.openEndDrawer();
        },
        icon: const Icon(Icons.people, size: 28));
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text('data $index'),
    );
  }

  Widget textHeadWidget() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Tweet',
        style: TextStyle(
            fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget notiWidget() {
    return Expanded(
        child: Align(
      alignment: Alignment.topRight,
      child: Stack(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NotiScreen();
                }));
              },
              icon: const Icon(
                Icons.notifications,
                size: 28,
              )),
          Positioned(
            right: 1,
            child: Badge.count(count: 19),
          )
        ],
      ),
    ));
  }

}
