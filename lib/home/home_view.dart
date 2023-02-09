import 'package:auth_management_provider/core/auth_manager.dart';
import 'package:auth_management_provider/core/cache_manager.dart';
import 'package:auth_management_provider/home/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  String? token = "";
  UserModel? userModel;

  @override
  void initState() {
    userModel = context.read<AuthManager>().userModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(token.toString()),
      ),
      body: Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(userModel?.imageUrl ?? ""),
        ),
      ),
    );
  }

  void getTokenFetch() async {
    token = await getToken();
    setState(() {});
  }
}
