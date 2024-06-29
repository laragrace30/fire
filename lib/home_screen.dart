import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.login_outlined,
                  size: 45, color: Colors.white))
        ],
        backgroundColor: const Color(0xFF333333),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Center(
                    child: Text("Welcome back ${user.email!}!",
                    style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
                    )),
                  ),
          )),
    );
  }
}
