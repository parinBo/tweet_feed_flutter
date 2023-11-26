
import 'package:firebase_core/firebase_core.dart';
import 'package:tweet_feed/firebase_options.dart';

class FireBaseSerive {
  // final database = FirebaseDatabase.instance;
  
  Future<void>  initialFirebase() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );

  }
}