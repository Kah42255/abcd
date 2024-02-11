import 'package:flutter/material.dart';
import 'package:ihateu/screens/fade.dart';
import 'package:ihateu/screens/home_switcher.dart';
import 'package:ihateu/wig/custom.dart';
import 'package:ihateu/screens/signup_page.dart';
class pagemain extends StatefulWidget {
  const pagemain({super.key});

  @override
  State<pagemain> createState() => _pagemainState();
}

class _pagemainState extends State<pagemain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [  SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/login2.jpg",
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              )
              ),
              Positioned(
            bottom: 20,
            left: 20,
            right: 20,
                child:SizedBox(child:Column(children: [
                   FadeInAnimation(
                    delay: 2,
                    child: CustomElevatedButton(
                      message: "Login",
                      function: () {
                         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeSwitcher()) ,
            );
                    //    GoRouter.of(context).pushNamed(Routers.loginpage.name);
                      },
                      color: const Color.fromARGB(255, 94, 218, 218),
                      sideColor: Colors.white,
                      
                      
                    ),
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  FadeInAnimation(
                    delay: 2.5,
                    child: ElevatedButton(
                        onPressed: () {
                        //  GoRouter.of(context)
                          //    .pushNamed(Routers.signuppage.name);
                           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUp()) ,
            );
                        },
                        style: ButtonStyle(
                            side: const MaterialStatePropertyAll(
                                BorderSide(color: Colors.white)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            fixedSize: const MaterialStatePropertyAll(
                                Size.fromWidth(370)),
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 20),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white)),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Urbanist-SemiBold",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  
                ],), ) ,),
              ]),
    );
  }
}