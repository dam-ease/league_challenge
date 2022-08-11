import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:league_challenge/core/api_service.dart';
import 'package:league_challenge/core/models/post_model.dart';
import 'package:league_challenge/core/repositories/login_repo.dart';
import 'package:league_challenge/core/repositories/posts_repo.dart';

final apiServiceProvider = FutureProvider<ApiService>((ref) async {
  final apiService = ApiService(ref);
  await apiService.clientSetup();
  return apiService;
});

final loginRepoProvider =
    StateNotifierProvider<LoginRepo, LoginState>((ref) => LoginRepo(ref.read));

final loginLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(loginRepoProvider);
  return repo.loading;
});

final postRepoProvider =
    StateNotifierProvider<PostRepo, PostState>((ref) => PostRepo(ref.read));

final postProvider = StateProvider<List<Post>?>((ref) {
  final repo = ref.watch(postRepoProvider);
  return repo.posts;
});
final postLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(postRepoProvider);
  return repo.loading;
});
