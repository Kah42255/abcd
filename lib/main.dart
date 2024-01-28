import 'package:flutter/material.dart';
import 'package:ihateu/routet/router_config.dart';
import 'package:ihateu/screens/1.dart';
import 'package:ihateu/onbording_screeen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: onbordingScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        primaryColor: const Color(0xFF35C2C1), 
        
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    //  routeInformationParser: router.routeInformationParser,
      //routerDelegate: router.routerDelegate,
      //routeInformationProvider: router.routeInformationProvider,
    );
  }
}
