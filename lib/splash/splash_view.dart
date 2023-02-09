import 'package:auth_management_provider/core/auth_manager.dart';
import 'package:auth_management_provider/home/home_view.dart';
import 'package:auth_management_provider/home/model/user_model.dart';
import 'package:auth_management_provider/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/login.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    controlToToApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void controlToToApp() async {
    await context.read<AuthManager>().fetchUserLogin();
    if (readAuthManager.isLogin) {
      await Future.delayed(Duration(seconds: 1));
      readAuthManager.userModel =
          UserModel(name: "EBP", imageUrl: "https://avatars.githubusercontent.com/u/58171409?v=4");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
    }
  }

  AuthManager get readAuthManager => context.read<AuthManager>();
}
