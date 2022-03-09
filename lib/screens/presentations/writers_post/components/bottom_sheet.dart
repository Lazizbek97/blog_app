import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/providers/comments_provider.dart';

class CommentsBottomSheet extends StatelessWidget {
  const CommentsBottomSheet({
    Key? key,
  }) : super(key: key);

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
              child: TextFormField(
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
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: context.watch<CommentsProvider>().comments!.length,
                separatorBuilder: (context, i) => const Divider(),
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://source.unsplash.com/random"),
                        ),
                        title:  Text( context.watch<CommentsProvider>().comments![index].email!),
                        subtitle: const Text("1 hrs ago"),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                        ),
                      ),
                       Text(
                          context.watch<CommentsProvider>().comments![index].body!, ),
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
