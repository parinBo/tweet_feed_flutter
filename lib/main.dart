import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet_feed/providers/coredata_provider.dart';
import 'package:tweet_feed/screens/home_screen.dart';
import 'package:tweet_feed/services/firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FireBaseSerive().initialFirebase();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CoreDataProvider())],
      child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          title: 'Tweet App',
          theme: ThemeData(
              primaryColor: Colors.blue, 
              scaffoldBackgroundColor: Colors.blue),
          home: const HomeScreen()),
    );
  }
}
