import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/utils/main_theme.dart';
import 'package:work_task/core/utils/router.dart';
import 'package:work_task/screens/providers/comments_provider.dart';
import 'package:work_task/screens/providers/post_provider.dart';
import 'package:work_task/screens/providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  RouteGenerator routeGenerate = RouteGenerator();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => CommentsProvider()),
      ],
      child: MaterialApp(
        title: 'Blog App',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.light,
        initialRoute: '/',
        onGenerateRoute: routeGenerate.routeGenerate,
      ),
    );
  }
}
