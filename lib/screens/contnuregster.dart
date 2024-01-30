import 'package:flutter/material.dart';
import 'package:ihateu/screens/fade.dart';
import 'package:ihateu/commme/comme.dart';
import 'package:ihateu/wig/custom.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ihateu/screens/paymont.dart';

class Contregster extends StatefulWidget {
  const Contregster({super.key});

  @override
  State<Contregster> createState() => _ContregsterState();
}

class _ContregsterState extends State<Contregster> {
  File? _image;

  Future<void> _addPhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECF4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
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
                            "Hello! set up  ",
                            style: Common().titelTheme,
                          ),
                        ),
                        FadeInAnimation(
                          delay: 1.2,
                          child: Text(
                            'profile',
                            style: Common().titelTheme,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInAnimation(
                    delay: 1.5,
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 4, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: _image != null
                                  ? DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(_image!),
                                    )
                                  : null,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: GestureDetector(
                              onTap: _addPhoto,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.white,
                                  ),
                                  color: Colors.blue,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Form(
                      child: Column(
                        children: [
                          FadeInAnimation(
                            delay: 1.8,
                            child: CustomTextFormField(
                              hinttext: 'Full Name',
                              obsecuretext: false,
                            ),
                          ),
                          SizedBox(height: 10),
                          FadeInAnimation(
                            delay: 1.8,
                            child: CustomTextFormField(
                              hinttext: 'Phone Number',
                              obsecuretext: false,
                            ),
                          ),
                          SizedBox(height: 10),
                          FadeInAnimation(
                            delay: 1.8,
                            child: CustomTextFormField(
                              hinttext: 'Make of Vehicle',
                              obsecuretext: false,
                            ),
                          ),
                          SizedBox(height: 10),
                          FadeInAnimation(
                            delay: 1.8,
                            child: CustomTextFormField(
                              hinttext: 'Year',
                              obsecuretext: false,
                            ),
                          ),
                          SizedBox(height: 10),
                          FadeInAnimation(
                            delay: 1.8,
                            child: CustomTextFormField(
                              hinttext: 'License Plate Number',
                              obsecuretext: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: FadeInAnimation(
                      delay: 2.1,
                      child: CustomElevatedButton(
                        message: 'Next',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Paymont()),
                          );
                        },
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
