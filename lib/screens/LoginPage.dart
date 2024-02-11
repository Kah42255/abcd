import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihateu/screens/fade.dart';
import 'package:ihateu/commme/comme.dart';
import 'package:ihateu/screens/signup_page.dart';
import 'package:ihateu/wig/custom.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to service page on successful login
      
    } catch (error) {
      print('Login error: $error');
      // Handle login error here
      // You can display an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 251, 237),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      // Navigate back to previous screen
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_return_sharp, size: 35),
                    color: const Color.fromARGB(255, 94, 218, 218),
                  ),
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
                        FadeInAnimation(
                          delay: 1.9,
                          child: CustomTextFormField(
                            controller: _emailController,
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
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              hintText: "Enter your password",
                              hintStyle: Common().hinttext,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword; // Toggle password visibility
                                  });
                                },
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        FadeInAnimation(
                          delay: 2.5,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Implement forget password functionality here
                              },
                              child: Text(
                                "Forget Password?",
                                style: Common().hinttext,
                              ),
                            ),
                          ),
                        ),
                        FadeInAnimation(
                          delay: 2.8,
                          child: CustomElevatedButton(
                            message: "Login",
                            function: _login,
                            color: const Color.fromARGB(255, 94, 218, 218),
                            sideColor: Colors.white,
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
                            style: Common().hinttext,
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
                                SvgPicture.asset("assets/images/facebook_ic (1).svg"),
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
                                    // Navigate to registration screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SignUp()),
                                    );
                                  },
                                  child: Text(
                                    "Register ",
                                    style: Common().mediumTheme,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
