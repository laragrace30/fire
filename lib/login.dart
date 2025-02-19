import 'package:firebase/button.dart';
import 'package:firebase/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not found') {
        wrongEmailMessage();
        Navigator.pop(context);
      } else if (e.code == 'wrong password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.grey,
            title: Center(
              child: Text(
                'Incorrect Email',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.grey,
            title: Center(
              child: Text(
                'Incorrect Password',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
          );
        });
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
                  'assets/images/logo.png',
                ),
              ),

              const SizedBox(height: 15),

              // EMAIL
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text('Email',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 8.0),
                  TextFields(
                    controller: emailController,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text('Password',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 8.0),
                  TextFields(
                    controller: passwordController,
                    hintText: 'Enter your passwordda',
                    obscureText: true,
                    prefixIcon:
                        const AssetImage('assets/images/vectorPassword.png'),
                  ),
                ],
              ),

              const SizedBox(height: 45),

              //LOGIN BUTTON
              Button(
                onTap: signUserIn,
                buttonText: "Login",
              ),

              const SizedBox(height: 15),

              GestureDetector(
                onTap: widget.onTap,
                child: const Text('Create an account',
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        decoration: TextDecoration.underline)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
