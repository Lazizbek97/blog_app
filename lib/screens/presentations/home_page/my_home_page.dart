import 'package:flutter/material.dart';
import 'package:work_task/core/utils/size_config.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(15.0), vertical: getHeight(8.0)),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.pushNamed(context, "/writers_posts"),
              child: const Card(
                child: ListTile(
                  title: Text("Writer's Name"),
                  subtitle: Text("All articles: 23"),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://source.unsplash.com/random"),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
