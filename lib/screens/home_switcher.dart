import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihateu/screens/LoginPage.dart';
import 'package:ihateu/screens/servicepage.dart';
class HomeSwitcher extends StatelessWidget {
  const HomeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (builder, snapshot) {
            if (snapshot.hasData) {
              return const servive();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
