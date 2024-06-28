import 'package:firebase/button.dart';
import 'package:firebase/text_field.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  Login({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(children: [
              // LOGO
              const SizedBox(height: 55),

              SizedBox(
                height: 270.0,
                child: Image.asset(
                  'assets/images/logoWname.png',
                ),
              ),

              const SizedBox(height: 15),

              // EMAIL
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email'),
                  const SizedBox(height: 8.0),
                  TextFields(
                    controller: usernameController,
                    hintText: 'Enter your email',
                    obscureText: false,
                    prefixIcon:
                        const AssetImage('assets/images/vectorEmail.png'),
                  ),
                ],
              ),

              const SizedBox(height: 23),

              // PASSWORD
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Password'),
                  const SizedBox(height: 8.0),
                  TextFields(
                    controller: passwordController,
                    hintText: 'Enter your passwordda',
                    obscureText: true,
                    prefixIcon: const AssetImage(
                        'assets/images/vectorPassword.png'),
                  ),
                ],
              ),

              const SizedBox(height: 55),

              //LOGIN BUTTON
              Button(
                onTap: signUserIn,
                buttonText: "Login",
              ),
            ]),
          ),
        ),
      ),
    );
  }
}