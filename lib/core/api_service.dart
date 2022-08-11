import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:league_challenge/utils/local_store_helper.dart';

class ApiService {
  ProviderReference ref;
  final Dio client = Dio();
  ApiService(this.ref);

  void setToken(String authToken) {
    LocalStoreHelper.saveInfo(authToken);
    client.options.headers['x-access-token'] = authToken;
  }

  Future<void> clientSetup() async {
    final String authToken = LocalStoreHelper.getUserToken();
    if (authToken.isNotEmpty) {
      this.client.options.headers['x-access-token'] = authToken;
    }
  }
}
