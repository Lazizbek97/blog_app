import 'package:flutter/material.dart';
import 'package:work_task/core/utils/constants.dart';
import 'package:work_task/core/utils/size_config.dart';

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
                          text: "Author name",
                          style: TextStyle(
                              fontSize: getHeight(16),
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: getHeight(45)),
                child: Column(
                  children: [
                    Text(
                      "How to become master in color palette",
                      style: TextStyle(
                          fontSize: getHeight(22), fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
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
        onPressed: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              isDismissible: true,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              builder: (context) {
                return const CommentsBottomSheet();
              });
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
                itemCount: 10,
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
                        title: const Text("Comment's owner name"),
                        subtitle: const Text("1 hrs ago"),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border)),
                      ),
                      const Text(
                          "You always give good advice. What would you say someone"),
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
