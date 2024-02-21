
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:ihateu/commme/comme.dart';
import 'package:ihateu/screens/LoginPage.dart';
import 'package:ihateu/screens/athentadres.dart';
import 'package:ihateu/screens/fade.dart';
import 'package:ihateu/wig/custom.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> signup() async {
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      // Check if password meets the minimum length requirement
      if (password.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password must be at least 6 characters long'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Passwords do not match'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const adrath()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User registration failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    icon: const Icon(
                      Icons.keyboard_return_sharp,
                      size: 35,
                      color: Color.fromARGB(255, 94, 218, 218),
                    ),
                    onPressed: () {
                      // GoRouter.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInAnimation(
                        delay: 1,
                        child: Text(
                          "Hello! Register to get  ",
                          style: Common().titelTheme,
                        ),
                      ),
                      FadeInAnimation(
                        delay: 1.2,
                        child: Text(
                          'started',
                          style: Common().titelTheme,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Form(
                    child: Column(
                      children: [
                        FadeInAnimation(
                          delay: 1.5,
                          child: CustomTextFormField(
                            controller: usernameController,
                            hinttext: 'username',
                            obsecuretext: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInAnimation(
                          delay: 1.8,
                          child: CustomTextFormField(
                            controller: emailController,
                            hinttext: 'Email',
                            obsecuretext: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInAnimation(
                          delay: 2.1,
                          child: CustomTextFormField(
                            controller: passwordController,
                            hinttext: 'password',
                            obsecuretext: true,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInAnimation(
                          delay: 2.4,
                          child: CustomTextFormField(
                            controller: confirmPasswordController,
                            hinttext: 'Confirm password',
                            obsecuretext: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            height: 50,
                            width: 350,
                            child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  CollectionReference collRef =
                                      FirebaseFirestore.instance
                                          .collection('users');
                                  collRef.add({
                                    'username':
                                        usernameController.text.toString(),
                                    'email': emailController.text.toString(),
                                  });

                                  // Continue with user registration
                                  await signup();
                                } catch (e) {
                                  // Handle errors
                                  print('Error: $e');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 94, 218, 218),
                                ),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Colors
                                          .white), // Add your desired side color here
                                ),
                              ),
                              child: const Text(
                                'register',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
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
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: Column(
                      children: [
                        FadeInAnimation(
                          delay: 2.9,
                          child: Text(
                            "Or Register with",
                            style: Common().semiboldblack,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInAnimation(
                          delay: 3.2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 30,
                              bottom: 10,
                              right: 30,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/facebook_ic (1).svg'),
                                SvgPicture.asset(
                                    'assets/images/google_ic-1.svg'),
                                Image.asset('assets/images/Vector.png'),
                              ],
                            ),
                          ),
                        ),
                        FadeInAnimation(
                          delay: 3.6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account ?',
                                  style: Common().hinttext,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                    );
                                  },
                                  child: Text(
                                    'Login Now',
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
