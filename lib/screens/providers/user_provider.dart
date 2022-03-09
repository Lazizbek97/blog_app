import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int userId = 1;
  changeUserId(int id) {
    userId = id;
    notifyListeners();
  }
}
