import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:league_challenge/core/config/app_config.dart';
import 'package:league_challenge/core/config/session_manager.dart';
import 'dart:convert' as convert;

import 'package:league_challenge/core/models/post_model.dart';

class PostState {
  bool loading;
  List<Post>? posts;
  PostState({this.loading = false, this.posts});
}

class PostRepo extends StateNotifier<PostState> {
  final Reader _read;
  PostRepo(this._read) : super(PostState());

  Future<List<Post>> getPosts() async {
    state = PostState(loading: true);
    final response =
        await http.get(Uri.parse('${AppConfig.LC_URL}/posts'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': SessionManager.instance.authToken,
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      final dynamic data = jsonResponse;

      final posts = List<Post>.from(data.map((json) {
        final post = Post.fromJson(json);
        return post;
      }));

      state = PostState(loading: false, posts: posts);
      return posts;
    } else {
      throw Exception('Failed to load');
    }
  }
}
