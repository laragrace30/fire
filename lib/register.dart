import 'package:firebase/button.dart';
import 'package:firebase/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        wrongPassMessage();
      }
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

  void wrongPassMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.grey,
            title: Center(
              child: Text(
                'Password does not match',
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
              const SizedBox(height: 15),

              SizedBox(
                height: 170.0,
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

              const SizedBox(height: 15),

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
                    controller: confirmpasswordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                    prefixIcon:
                        const AssetImage('assets/images/vectorPassword.png'),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text('Confirm Password',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 8.0),
                  TextFields(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                    prefixIcon:
                        const AssetImage('assets/images/vectorPassword.png'),
                  ),
                ],
              ),

              const SizedBox(height: 55),

              //LOGIN BUTTON
              Button(
                onTap: signUserUp,
                buttonText: "Register",
              ),

              const SizedBox(height: 15),

              GestureDetector(
                onTap: widget.onTap,
                child: const Text('have an account? Login',
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
