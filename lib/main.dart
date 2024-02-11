import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ihateu/firebase_options.dart';
import 'package:ihateu/onbording_screeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
