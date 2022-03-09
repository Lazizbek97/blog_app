import 'package:flutter/material.dart';
import 'package:work_task/core/models/users_model.dart';
import 'package:work_task/core/services/users_service.dart';

class UserProvider extends ChangeNotifier {
  int userId = 1;
  UserModel? curUser;
  changeUserId(int id, String name) async {
    userId = id;

    notifyListeners();
  }

 Future getCurUser() async {
    await UserSerivce.fetchUser().then((value) => curUser = value[userId-1]);
    notifyListeners();
  }
}
