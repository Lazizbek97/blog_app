import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:work_task/core/utils/constants.dart';
import 'package:work_task/core/utils/size_config.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SizedBox(
            height: getHeight(160),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: getHeight(150),
                    width: getWidth(150),
                    margin: EdgeInsets.only(right: getWidth(15)),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Constants.border_radius),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage("https://source.unsplash.com/random"),
                      ),
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
                        const Text('User Id: '),
                        Text(
                          "",
                          style: TextStyle(
                              fontSize: getHeight(16),
                              fontWeight: FontWeight.w600),
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
      },
    );
  }
}
