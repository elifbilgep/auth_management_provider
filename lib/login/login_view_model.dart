import 'dart:math';

import 'package:auth_management_provider/core/auth_manager.dart';
import 'package:auth_management_provider/core/cache_manager.dart';
import 'package:auth_management_provider/home/home_view.dart';
import 'package:auth_management_provider/home/model/user_model.dart';
import 'package:auth_management_provider/login/model/user_request_model.dart';
import 'package:auth_management_provider/login/service/ILoginService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import './login.dart';

abstract class LoginViewModel extends State<Login> with CacheManager {
  late final LoginService loginService;
  final baseUrl = "https://reqres.in";

  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(PrettyDioLogger());

    loginService = LoginService(dio);
  }

  void fetchUserLogin(String email, String password) async {
    final response = await loginService.fetchLogin(UserRequestModel(email: email, password: password));
    if (response != null) {
      saveToken(response.token ?? "");
      navigateToHome();
      context.read<AuthManager>().userModel =
          UserModel(name: "EBP", imageUrl: "https://avatars.githubusercontent.com/u/58171409?v=4");
    }
  }

  void navigateToHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
  }
}
