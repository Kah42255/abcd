import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/Plan de travail 1.jpg',
          fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,),
          
        ],
      )
    );
  }
}
