import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 10.w,
                ),
                Text('Username'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('Title'),
            SizedBox(
              height: 10,
            ),
            Text('Description'),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            )
          ],
        ));
  }
}
