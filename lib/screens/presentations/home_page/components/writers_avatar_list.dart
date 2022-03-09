import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/core/data/local_data/writers_avatars.dart';
import 'package:work_task/core/models/users_model.dart';
import 'package:work_task/core/utils/size_config.dart';
import 'package:work_task/screens/providers/user_provider.dart';

class AvatarListView extends StatelessWidget {
  const AvatarListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Avatars.pictures.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context
                .read<UserProvider>()
                .changeUserId(users[index].id!, users[index].name!);
          },
          child: Column(
            children: [
              Container(
                height: getHeight(80),
                width: getHeight(90),
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
}
