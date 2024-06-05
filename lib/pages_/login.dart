import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../mainhome.dart';
import '../widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:osm_map/Utills/toast.dart';
import 'package:osm_map/mainhome.dart';

import 'forgetpass.dart';
import 'phonenumb.dart';
import 'round_button.dart';
import 'signup.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((value) {
      Utills().ToastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainHome()));
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utills().ToastMessage(error.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffe96443),
              Color(0xff904e95),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Form(
                key: _formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      const Image(
                        image: AssetImage('assets/login 11.png'),
                        height: 200,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 20),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            hintText: 'Enter Email',
                            fillColor: Colors.white70,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xffDADADA),
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xffDADADA),
                                )),
                            focusColor: const Color(0xffDADADA)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter value ';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                hintText: 'Enter Password',
                                fillColor: Colors.white70,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xffDADADA),
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xffDADADA),
                                    )),
                                focusColor: const Color(0xffDADADA)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter value ';
                              } else {
                                return null;
                              }
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  login();
                                } else {
                                  Utills().ToastMessage("Invalid Credentials");
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 20),
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  fontFamily: 'Urbanst',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              children: [
                            const TextSpan(text: 'Don\'t have an account?'),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MySign()));
                                  },
                                text: ' Register Now',
                                style: const TextStyle(
                                  fontFamily: 'Urbanst',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xffFA7C2F),
                                ))
                          ])),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  fontFamily: 'Urbanst',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              children: [
                            const TextSpan(text: 'If you'),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyForgotPassword()));
                                  },
                                text: ' Forget Password',
                                style: const TextStyle(
                                  fontFamily: 'Urbanst',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xffFA7C2F),
                                ))
                          ])),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  fontFamily: 'Urbanst',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              children: [
                            const TextSpan(text: 'SignUp with'),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyPhoneNumber()));
                                  },
                                text: ' Phone Number',
                                style: const TextStyle(
                                  fontFamily: 'Urbanst',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xffFA7C2F),
                                ))
                          ]))
                    ]),
              )),
        ),
      ),
    );
  }
}
