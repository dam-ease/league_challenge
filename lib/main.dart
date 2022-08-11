import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:league_challenge/utils/colors.dart';
import 'package:league_challenge/views/login_page.dart';

void main() {
  runApp(ProviderScope(child: const LeagueChallenge()));
}

class LeagueChallenge extends StatelessWidget {
  const LeagueChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: bgColor),
          title: 'League Challenge',
          home: const LoginPage()),
    );
  }
}
