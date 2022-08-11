import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:league_challenge/core/provider_registry.dart';
import 'package:league_challenge/utils/constants.dart';
import 'package:league_challenge/utils/styles.dart';
import 'package:league_challenge/views/home_page.dart';
import 'package:league_challenge/widgets/custom_loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loadingKey = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Welcome!',
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text('Email'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: outlineBorder,
                hintText: 'Enter your email',
                border: outlineBorder,
                hintStyle: hintStyle,
                focusedBorder: focusedBorder,
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Text('Password'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: outlineBorder,
                hintText: 'Enter your password',
                border: outlineBorder,
                hintStyle: hintStyle,
                focusedBorder: focusedBorder,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            TextButton(
              onPressed: _handleLogin,
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }

  _handleLogin() async {
    CustomLoadingDialog.showLoading(context, _loadingKey, "Authenticating...");

    final response = await context.read(loginRepoProvider.notifier).login();
    CustomLoadingDialog.hideLoading(_loadingKey);

    if (response) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
