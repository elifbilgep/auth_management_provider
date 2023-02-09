import 'core/auth_manager.dart';
import 'login/login.dart';
import 'splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      Provider(
        create: (context) => AuthManager(context: context),
        lazy: true, // it means it will invoke when it is called
      ),
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: SplashView());
  }
}
