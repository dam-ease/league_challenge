import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:league_challenge/core/config/app_config.dart';
import 'dart:convert' as convert;

import 'package:league_challenge/core/models/user_data_model.dart';

class UserState {
  bool loading;
  List<UserData>? token;
  UserState({this.loading = false, this.token});
}

class UserRepo extends StateNotifier<UserState> {
  final Reader _read;
  UserRepo(this._read) : super(UserState());

  Future<String> login() async {
    state = UserState(loading: true);
    final response = await http.get(Uri.parse('${AppConfig.LC_URL}/users'));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      final dynamic data = jsonResponse;

      state = UserState(loading: false, token: data);
      return data;
    } else {
      throw Exception('Failed to load');
    }
  }
}
