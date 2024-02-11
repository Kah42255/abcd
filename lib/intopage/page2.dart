import 'package:flutter/material.dart';
class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
        Image.asset(
            'assets/images/Plan de travail 3.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      )
    );
  }
}