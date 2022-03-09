import 'package:flutter/material.dart';
import 'package:work_task/core/data/local_data/writers_avatars.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/presentations/home_page/components/article.dart';

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
              height: getHeight(130),
              child: ListView.builder(
                  itemCount: Avatars.pictures.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: getHeight(80),
                          width: getHeight(80),
                          margin: EdgeInsets.symmetric(horizontal: getWidth(5)),
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
                        const Text("User ID:"),
                        const Text("Username:"),
                      ],
                    );
                  }),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(15.0),
                  vertical: getHeight(8.0),
                ),
                child: ListView.builder(
                  key: UniqueKey(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/posts_list_page");
                      },
                      child: const Article(),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
