import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/data/local_data/writers_avatars.dart';
import 'package:work_task/core/models/posts_model.dart';
import 'package:work_task/core/models/users_model.dart';
import 'package:work_task/core/services/posts_service.dart';
import 'package:work_task/core/services/users_service.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/presentations/home_page/components/article.dart';
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
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Somthing went wrong"),
                      );
                    } else {
                      List<UserModel> users = snapshot.data!;
                      return ListView.builder(
                        itemCount: Avatars.pictures.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.read<UserProvider>().changeUserId(
                                  users[index].id!, users[index].name!);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: getHeight(80),
                                  width: getHeight(80),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: getWidth(5)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        Avatars.pictures[index],
                                      ),
                                    ),
                                  ),
                                ),
                                Text("User ID: ${users[index].id}"),
                                const Text("Username:"),
                                Text(
                                  "${users[index].username}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      );
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
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
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
