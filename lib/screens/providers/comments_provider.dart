import 'package:flutter/material.dart';
import 'package:work_task/core/models/comments_model.dart';
import 'package:work_task/core/services/comments_service.dart';

class CommentsProvider extends ChangeNotifier {
  List<CommentsModel>? comments;
  Future getComments(int id) async {
    await CommentsService.fetchComments().then((value) =>
        comments = value.where((element) => element.postId == id).toList());
  }
}
