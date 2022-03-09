import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/services/add_comment_service.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/providers/comments_provider.dart';
import 'package:work_task/screens/providers/post_provider.dart';

class CommentsBottomSheet extends StatelessWidget {
  CommentsBottomSheet({
    Key? key,
  }) : super(key: key);

  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      child: SizedBox(
        height: getHeight(600),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: getHeight(10)),
              child: TextField(
                controller: _textController,
                textInputAction: TextInputAction.go,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Add comments here ...",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onSubmitted: (inputText) async {
                  await AddingCommentSerivce.add_commit(
                    id: 1,
                    postId: Provider.of<PostProvider>(context, listen: false)
                        .post!
                        .id!,
                    name: "user's name",
                    body: inputText,
                    email: "usersEmail@gmail.com",
                  ).then(
                    
                    // ? Check if comment successfully added or not

                    (value) => value == 201
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Comment successfully added"),
                            ),
                          )
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Comment fialed"),
                            ),
                          ),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: context.watch<CommentsProvider>().comments!.length,
                separatorBuilder: (context, i) => const Divider(),
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://source.unsplash.com/random"),
                        ),
                        title: Text(context
                            .watch<CommentsProvider>()
                            .comments![index]
                            .email!),
                        subtitle: Text("${index + 1} hrs ago"),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                        ),
                      ),
                      Text(
                        context
                            .watch<CommentsProvider>()
                            .comments![index]
                            .body!,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
