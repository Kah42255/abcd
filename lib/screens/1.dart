import 'package:flutter/material.dart';
import 'package:ihateu/screens/fade.dart';
import 'package:ihateu/commme/comme.dart';
import 'package:ihateu/wig/custom.dart';
import 'package:go_router/go_router.dart';
import 'package:ihateu/routet/routers.dart';
import 'package:ihateu/screens/LoginPage.dart';
import 'package:ihateu/screens/signup_page.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [  SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/klee-clara-v0-p614e1ii6bcb1.png",
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              )
              ),
              Positioned(
            bottom: 20,
            left: 20,
            right: 20,
                child:SizedBox(child:Column(children: [FadeInAnimation(delay:1,child: Container(
                  height: 60,
                  width: 60,
                decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/main logo light color.png"))),
                ),),FadeInAnimation(
                    delay: 1.5,
                    child: Text(
                      "Flutter Spirit ❤️",
                      style: Common().titelTheme,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                   FadeInAnimation(
                    delay: 2,
                    child: CustomElevatedButton(
                      message: "Login",
                      function: () {
                         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()) ,
            );
                    //    GoRouter.of(context).pushNamed(Routers.loginpage.name);
                      },
                      color: Colors.black,
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
              MaterialPageRoute(builder: (context) => const singup()) ,
            );
                        },
                        style: ButtonStyle(
                            side: const MaterialStatePropertyAll(
                                BorderSide(color: Colors.black)),
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