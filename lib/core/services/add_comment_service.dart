import 'package:dio/dio.dart';
import 'package:work_task/core/models/comments_model.dart';

class AddingCommentSerivce {
  static String baseUrl = "http://jsonplaceholder.typicode.com/comments";
  static Future add_commit({
    required int id,
    required String body,
    required String name,
    required String email,
    required int postId,
  }) async {
    var dio = Dio();

    Response response = await dio.post(baseUrl,
        data: CommentsModel(
                id: id, body: body, email: email, name: name, postId: postId)
            .toJson());
    return response.statusCode;
  }
}
