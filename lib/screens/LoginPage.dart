import 'package:flutter/material.dart';
import 'package:ihateu/screens/fade.dart';
import 'package:ihateu/commme/comme.dart';
import 'package:ihateu/wig/custom.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFE8ECF4),
      body: SafeArea(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInAnimation(
                  delay: 1,
                  child: IconButton(
                      onPressed: () {
                    //    GoRouter.of(context)
                          //  .pushNamed(Routers.main.name);
                      },
                      icon: const Icon(Icons.keyboard_return_sharp, size: 35)),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInAnimation(
                        delay: 1.3,
                        child: Text(
                          "Welcome back! Glad ",
                          style: Common().titelTheme,
                        ),
                      ),
                      FadeInAnimation(
                        delay: 1.6,
                        child: Text(
                          "to see you, Again!",
                          style: Common().titelTheme,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    child: Column(
                      children: [
                        const FadeInAnimation(
                          delay: 1.9,
                          child: CustomTextFormField(
                            hinttext: 'Enter your email',
                            obsecuretext: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInAnimation(
                          delay: 2.2,
                          child: TextFormField(
                            obscureText: flag ? true : false,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(18),
                                hintText: "Enter your password",
                                hintStyle: Common().hinttext,
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12)),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.remove_red_eye_outlined))),
                          ),
                        ),
                        FadeInAnimation(
                          delay: 2.5,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: Common().semiboldblack,
                                )),
                          ),
                        ),
                        FadeInAnimation(
                          delay: 2.8,
                          child: CustomElevatedButton(
                            message: "Login",
                            function: () {
                              if (flag) {
                                setState(() {
                                  flag = false;
                                });
                              } else {
                                setState(() {
                                  flag = true;
                                });
                              }
                            },
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      children: [
                        FadeInAnimation(
                          delay: 2.2,
                          child: Text(
                            "Or Log with",
                            style: Common().semiboldblack,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInAnimation(
                          delay: 2.4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 30, left: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    "assets/images/facebook_ic (1).svg"),
                                SvgPicture.asset("assets/images/google_ic-1.svg"),
                                Image.asset("assets/images/Vector.png")
                              ],
                            ),
                          ),
                        ),
                        FadeInAnimation(
                          delay: 2.8,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?",
                                  style: Common().hinttext,
                                ),
                                TextButton(
                                    onPressed: () {
                                    //  GoRouter.of(context)
                                      //    .pushNamed(Routers.signuppage.name);
                                    },
                                    child: Text(
                                      "Register ",
                                      style: Common().mediumTheme,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
