import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/providers/post_provider.dart';
import 'package:work_task/screens/providers/user_provider.dart';

class Article extends StatelessWidget {
  Article({required this.userId, required this.title, required this.postID, Key? key})
      : super(key: key);

  int postID;
  int userId;
  String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.read<PostProvider>().getPost(postID);
        await context
            .read<UserProvider>()
            .getCurUser()
            .then((value) => Navigator.pushNamed(
                  context,
                  "/writers_posts",
                ));
      },
      child: SizedBox(
        height: getHeight(160),
        child: Row(
          children: [
            Container(
              height: getHeight(150),
              width: getWidth(150),
              margin: EdgeInsets.only(right: getWidth(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://source.unsplash.com/random"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: getHeight(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('User Id: $userId'),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: getHeight(16), fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Text("1.2k"),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            const Text("12"),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.comment,
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
