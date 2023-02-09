import 'package:auth_management_provider/login/login_resources.dart';
import 'package:flutter/material.dart';
import './login_view_model.dart';

class LoginView extends LoginViewModel with LoginResources {
  final EdgeInsets paddingNormal = const EdgeInsets.all(20.0);
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarLoginText),
      ),
      body: Padding(
        padding: paddingNormal,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: buildForm(),
        ),
      ),
    );
  }

  Column buildForm() {
    return Column(
      children: [
        const Spacer(
          flex: 4,
        ),
        TextFormField(
          controller: emailEditingController,
          decoration: InputDecoration(labelText: emailtext, border: const OutlineInputBorder()),
        ),
        const Spacer(),
        TextFormField(
          controller: passwordEditingController,
          decoration: InputDecoration(labelText: passwordText, border: const OutlineInputBorder()),
        ),
        const Spacer(),
        ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                fetchUserLogin(emailEditingController.text, passwordEditingController.text);
              }
            },
            child: Text(buttonText)),
        const Spacer(
          flex: 18,
        )
      ],
    );
  }
}
