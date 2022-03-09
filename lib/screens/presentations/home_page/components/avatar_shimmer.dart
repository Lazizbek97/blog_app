import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:work_task/core/utils/constants.dart';
import 'package:work_task/core/utils/size_config.dart';

class AvatarShimmer extends StatelessWidget {
  const AvatarShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Container(
            height: getHeight(80),
            width: getHeight(90),
            margin: EdgeInsets.symmetric(horizontal: getWidth(5)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.border_radius),
            ),
          ),
          const Text("User ID: "),
          const Text("Username:"),
          const Text(
            "username",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
