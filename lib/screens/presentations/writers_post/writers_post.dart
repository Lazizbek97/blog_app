import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/utils/constants.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/presentations/writers_post/components/bottom_sheet.dart';
import 'package:work_task/screens/providers/comments_provider.dart';
import 'package:work_task/screens/providers/post_provider.dart';
import 'package:work_task/screens/providers/user_provider.dart';

class Writers_posts extends StatelessWidget {
  const Writers_posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: getHeight(220),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage("https://source.unsplash.com/random")),
                    borderRadius:
                        BorderRadius.circular(Constants.border_radius),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: getHeight(15)),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "by  ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: context.watch<UserProvider>().curUser!.name,
                        style: TextStyle(
                            fontSize: getHeight(16),
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: getHeight(65)),
                child: Column(
                  children: [
                    Text(
                      context.watch<PostProvider>().post!.title.toString(),
                      style: TextStyle(
                          fontSize: getHeight(22), fontWeight: FontWeight.w600),
                    ),
                    Text(
                      context.watch<PostProvider>().post!.body.toString(),
                      textAlign: TextAlign.justify,
                    ),
                    // ? Added Lorem Ipsum Text so that it looks  like more real post
                    const Text(
                      "\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {

          // ? gets this post's comments and save it to provider
          
          await context
              .read<CommentsProvider>()
              .getComments(
                  Provider.of<PostProvider>(context, listen: false).post!.id!)
              .then(
                (value) => showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  isDismissible: true,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                  builder: (context) {
                    return CommentsBottomSheet();
                  },
                ),
              );
        },
        backgroundColor: Colors.white,
        label: const Text(
          "Comments",
          style: TextStyle(color: Colors.black),
        ),
        icon: const CircleAvatar(
          child: Icon(
            Icons.mode_comment_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
