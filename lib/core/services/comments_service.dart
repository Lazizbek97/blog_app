import 'package:dio/dio.dart';
import 'package:work_task/core/models/comments_model.dart';

class CommentsService {
  static Future<List<CommentsModel>> fetchComments() async {
    Response<dynamic> response =
        await Dio().get('https://jsonplaceholder.typicode.com/comments');

    return (response.data as List)
        .map((e) => CommentsModel.fromJson(e))
        .toList();
  }
}
