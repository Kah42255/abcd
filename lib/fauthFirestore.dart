// create the user account and store it's UserCredential 
UserCredential userCredential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: "abdesslerm@gmail.com",
                                    password: "abdeeeee",
                                  );
// use the uid from the UserCredential to use it to store some data about the user in firestore 
String uid = userCredential.user!.uid;
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(uid)
                                      .set({
                                    'name': "abdee",
                                    'email': "abdesslerm@gmail.com",
                                    'phone_number': '0699900',
                                    'type': "service_provider"
                                  });
// sign up the user when the account already exists in another screen 
UserCredential userCredential =await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
