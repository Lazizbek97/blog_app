import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/models/posts_model.dart';
import 'package:work_task/core/models/users_model.dart';
import 'package:work_task/core/services/posts_service.dart';
import 'package:work_task/core/services/users_service.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/presentations/home_page/components/article.dart';
import 'package:work_task/screens/presentations/home_page/components/avatar_shimmer.dart';
import 'package:work_task/screens/presentations/home_page/components/post_shimmer.dart';
import 'package:work_task/screens/presentations/home_page/components/writers_avatar_list.dart';
import 'package:work_task/screens/providers/user_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text("Popular Writers"),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                //? Profile page link comes here
              },
              child: Padding(
                padding: EdgeInsets.only(right: getWidth(10)),
                child: const CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://source.unsplash.com/random"),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: getHeight(150),
              child: FutureBuilder<List<UserModel>>(
                  future: UserSerivce.fetchUser(),
                  builder: ((context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => const AvatarShimmer(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Somthing went wrong"),
                      );
                    } else {
                      List<UserModel> users = snapshot.data!;
                      return AvatarListView(users: users);
                    }
                  })),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(15.0),
                  vertical: getHeight(8.0),
                ),
                child: FutureBuilder<List<PostModel>>(
                  future: PostsService.fetchPost(),
                  builder: ((context, AsyncSnapshot<List<PostModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return const PostShimmer();
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Somthing went wrong"),
                      );
                    } else {
                      List<PostModel> userPosts = snapshot.data!
                          .where((element) =>
                              element.userId ==
                              context.watch<UserProvider>().userId)
                          .toList();
                      return ListView.builder(
                        itemCount: userPosts.length,
                        key: UniqueKey(),
                        itemBuilder: (context, index) {
                          return Article(
                            userId: userPosts[index].userId!,
                            title: userPosts[index].title!,
                            postID: userPosts[index].id!,
                            index: index,
                          );
                        },
                      );
                    }
                  }),
                ),
              ),
            ),
          ],
        ));
  }
}
