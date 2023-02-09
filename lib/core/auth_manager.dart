// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auth_management_provider/core/cache_manager.dart';
import 'package:auth_management_provider/home/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthManager extends CacheManager {
  BuildContext context;
  AuthManager({
    required this.context,
  }) {
    fetchUserLogin();
  }

  bool isLogin = false;
  UserModel? userModel;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
