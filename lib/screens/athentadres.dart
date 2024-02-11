import 'package:flutter/material.dart';
import 'package:ihateu/commme/comme.dart';
import 'package:ihateu/wig/custom.dart';

class adrath extends StatelessWidget {
  const adrath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/email check.jpg',
          fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,),
             Align(
            alignment: const Alignment(0.0, 0.3), // Adjust the vertical position here
            child: CustomElevatedButton(
              function: () {
                
              },
              message:'send' ,
              color: const Color.fromARGB(255, 94, 218, 218),
              sideColor:Colors.white ,
            ),
          ),
           Positioned(
            bottom: 50, // Adjust the distance from the bottom here
            left: 0,
            right: 0,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Add your onPressed action for the first text button
                  },
                  child: Text(
                    'Resend E-maill link',
                    style: Common().mediumTheme, // Adjust the text style here
                  ),
                ),
                TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    'back to login',
                    style: Common().mediumTheme, // Adjust the text style here
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}