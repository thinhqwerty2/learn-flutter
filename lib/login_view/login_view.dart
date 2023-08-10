import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.appName});

  final String appName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(appName),
              leading:
                  const Image(image: AssetImage('assets/login_img/logo.ico')),
            ),
            body: const Center(child: FormLogin())));
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: TextField(
              autofocus: true,
            ),
          ),
          SizedBox(width: 100, height: 100, child: TextField()),
        ],
      ),
    );
  }
}
