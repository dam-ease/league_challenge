import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:league_challenge/core/config/app_config.dart';
import 'dart:convert' as convert;

import 'package:league_challenge/core/provider_registry.dart';

class LoginState {
  bool loading;
  String? token;
  LoginState({this.loading = false, this.token});
}

class LoginRepo extends StateNotifier<LoginState> {
  final Reader _read;
  LoginRepo(this._read) : super(LoginState());

  Future<bool> login() async {
    Response? response;
    try {
      state = LoginState(loading: true);
      final apiService = await _read(apiServiceProvider.future);
      response = await apiService.client.get('${AppConfig.LC_URL}/login');
      var jsonResponse = convert.jsonDecode(response.data);
      final dynamic data = jsonResponse['api_key'];
      apiService.setToken(data);
      state = LoginState(loading: false, token: data);
    } catch (e) {
      throw Exception('Failed to load');
    }
    return response.statusCode == 200;
  }
}
