import 'package:dio/dio.dart';
import 'package:work_task/core/models/posts_model.dart';

class PostsService {
  static Future<List<PostModel>> fetchPost() async {
    Response<dynamic> response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }
}
