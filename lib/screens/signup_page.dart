import 'package:flutter/material.dart';
import 'package:ihateu/screens/fade.dart';
import 'package:go_router/go_router.dart';
import 'package:ihateu/commme/comme.dart';
import 'package:ihateu/wig/custom.dart';
import 'package:flutter_svg/svg.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: const Color(0xFFE8ECF4),

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
                  ),
                  onPressed: () {
                    //    GoRouter.of(context).pop();
                  },
                ),
              ),
              Padding(padding: const EdgeInsets.all(12),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInAnimation( delay: 1,child:Text("Hello! Register to get  ",style: Common().titelTheme,) ,),
                  FadeInAnimation(delay: 1.2, child: Text('started',style: Common().titelTheme,))
                ],
              ),),
              Padding(padding: const EdgeInsets.all(12),
              child:Form(child: Column(
                children: [
                  const FadeInAnimation(delay: 1.5, child: CustomTextFormField(hinttext: 'username', obsecuretext: false)),
                  const SizedBox(height:10 ),
                  const FadeInAnimation(delay: 1.8, child: CustomTextFormField(hinttext: 'Email', obsecuretext: false)),
                                  const SizedBox(height:10 ),
                                  const FadeInAnimation(delay: 2.1, child: CustomTextFormField(hinttext: 'password', obsecuretext: true)),
                                   const SizedBox(
                          height: 10,
                        ),
                        const FadeInAnimation(
                          delay: 2.4,
                          child: CustomTextFormField(
                            hinttext: 'Confirm password',
                            obsecuretext: false,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInAnimation(
                          delay: 2.7,
                          child: CustomElevatedButton(
                            message: "Register",
                            function: () {},
                            color: Colors.black,
                          ),
                        ),
            
            
                ],
              )
              )
              ),
                    const SizedBox(
                  height: 15,
                ),
                Padding(padding: const EdgeInsets.all(12),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Column(
                    children: [
                      FadeInAnimation(delay: 2.9, child:  Text("Or Register with",
                          style: Common().semiboldblack,)),
                           const SizedBox(
                        height: 20,
                      ),
                      FadeInAnimation(delay: 3.2, child: Padding(padding: const EdgeInsets.only(top: 10,left: 30,bottom: 10,right: 30),
                      child:Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        SvgPicture.asset('assets/images/facebook_ic (1).svg'),
                        SvgPicture.asset('assets/images/google_ic-1.svg'),
                        Image.asset('assets/images/Vector.png')
                      ],) , )),
                    FadeInAnimation(delay: 3.6, child:  Padding( padding:const EdgeInsets.only(left: 50),child:
                Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    Text('Already have an account ?',style:Common().hinttext ,),
                    TextButton(onPressed: () {
                      
                    }, child: Text('Login Now',style: Common().mediumTheme,))
                  ],
                ) ,))
                    ],
                  ),
                ),
                ),
              
            ],
                    ),
                  ),
          )),
    );
  }
}
