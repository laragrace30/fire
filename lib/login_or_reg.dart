import 'package:firebase/login.dart';
import 'package:firebase/register.dart';
import 'package:flutter/material.dart';

class LoginOrReg extends StatefulWidget {
  const LoginOrReg({super.key});

  @override
  State<LoginOrReg> createState() => _LoginOrRegState();
}

class _LoginOrRegState extends State<LoginOrReg> {
  bool showLogin = true;

  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(onTap: togglePages);
    } else {
      return Register(onTap: togglePages);
    }
  }
}
