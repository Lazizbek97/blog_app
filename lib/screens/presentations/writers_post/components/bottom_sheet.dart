import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/services/add_comment_service.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/presentations/writers_post/components/comments_fileds.dart';
import 'package:work_task/screens/providers/comments_provider.dart';
import 'package:work_task/screens/providers/post_provider.dart';

class CommentsBottomSheet extends StatelessWidget {
  CommentsBottomSheet({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _textFormKey = GlobalKey<FormState>();

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(20),
      ),
      child: SizedBox(
        height: getHeight(700),
        child: Scaffold(
          body: Column(
            children: [
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: getHeight(10)),
                child: SizedBox(
                  height: getHeight(45),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: AddCommentFields(
                                  nameFormKey: _nameFormKey,
                                  nameController: _nameController,
                                  emailFormKey: _emailFormKey,
                                  emailController: _emailController,
                                  textFormKey: _textFormKey,
                                  textController: _textController),
                              title: const Text(
                                "New Comment",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: getHeight(5),
                                  horizontal: getWidth(15)),
                              actions: [
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await _submitComment(context);
                                    },
                                    child: const Text("Submit Comment"),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text("Add Commit"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submitComment(BuildContext context) async {
    final bool nameform = _nameFormKey.currentState!.validate();
    final bool emailform = _emailFormKey.currentState!.validate();
    final bool textform = _textFormKey.currentState!.validate();

    if (nameform && emailform && textform) {
      await AddingCommentSerivce.add_commit(
        id: 1,
        postId: Provider.of<PostProvider>(context, listen: false).post!.id!,
        name: _nameController.text,
        body: _textController.text,
        email: _emailController.text,
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
    } else {
      print('Form is invalid');
    }
  }
}
