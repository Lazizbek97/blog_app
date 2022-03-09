import 'package:flutter/material.dart';
import 'package:work_task/core/utils/size_config.dart';

class Article extends StatelessWidget {
  const Article({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/writers_posts"),
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
                    const Text('10 mins read'),
                    Text(
                      "Make design systems people want to use",
                      style: TextStyle(
                          fontSize: getHeight(16), fontWeight: FontWeight.w600),
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
