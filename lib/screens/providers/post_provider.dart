import 'package:flutter/material.dart';
import 'package:work_task/core/models/posts_model.dart';
import 'package:work_task/core/services/posts_service.dart';

class PostProvider extends ChangeNotifier {
  PostModel? post;

  Future getPost(int id) async {
    print(id);
    await PostsService.fetchPost().then((value) => post = value[id]);
    notifyListeners();
  }
  
}
