import 'package:flutter/material.dart';
import 'package:league_challenge/core/models/post_model.dart';
import 'package:league_challenge/core/provider_registry.dart';
import 'package:league_challenge/widgets/post_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read(postRepoProvider.notifier).getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Posts',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        body: Consumer(builder: (context, watch, _) {
          final List<Post>? posts = watch(postProvider).state;

          final bool isLoading = watch(postLoadingProvider).state;
          return isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : posts!.length > 0
                  ? ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        var post = posts[index];
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
                                    Text('${post.id}'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${post.title}'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${post.body}'),
                                Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                )
                              ],
                            ));
                      })
                  : Container();
        }));
  }
}
