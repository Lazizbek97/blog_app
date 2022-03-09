import 'package:dio/dio.dart';
import 'package:work_task/core/models/users_model.dart';

class UserSerivce {
  static Future<List<UserModel>> fetchUser() async {
    Response<dynamic> response =
        await Dio().get('https://jsonplaceholder.typicode.com/users');
    // print(response.data);

    return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
  }
}
