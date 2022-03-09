import 'package:flutter/material.dart';
import 'package:work_task/screens/presentations/home_page/my_home_page.dart';
import 'package:work_task/screens/presentations/writers_post/writers_post.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case "/writers_posts":
        return MaterialPageRoute(builder: (context) => const Writers_posts());
    
    }
    return null;
  }
}
