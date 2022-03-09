import 'package:flutter/material.dart';
import 'package:work_task/core/utils/main_theme.dart';
import 'package:work_task/core/utils/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  RouteGenerator routeGenerate = RouteGenerator();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.light,
      initialRoute: '/',
      onGenerateRoute: routeGenerate.routeGenerate,
    );
  }
}
