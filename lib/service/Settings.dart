import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: IconButton(onPressed: () {
          FirebaseAuth.instance.signOut();
        }, icon:const Icon(Icons.logout))
        
      ),
    );
  }
}