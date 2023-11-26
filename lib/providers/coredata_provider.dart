import 'package:flutter/foundation.dart';
import 'package:tweet_feed/models/user_model.dart';

class CoreDataProvider with ChangeNotifier {

  late UserModel _user = UserModel();

  UserModel get user => _user; 

  void setUser(UserModel userData) {
    _user = userData;
    notifyListeners();
  }

}