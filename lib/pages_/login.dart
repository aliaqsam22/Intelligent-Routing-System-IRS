import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../mainhome.dart';
import 'forgetpass.dart';
import 'signup.dart';
import '../widgets/textfield.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20), // Set the border radius of the bottom edge
              ),
            ),
            elevation: 5, // Set elevation for a shadow effect
            shadowColor: Colors.grey,
            title: const Text('Login',style:TextStyle(color:Colors.white70,fontSize: 30)),
          centerTitle: true,
            backgroundColor: Colors.black87
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/login 11.png'),
                    height: 200,
                    width: double.infinity,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Textfield(context, Colors.white70, 'Enter Email', true),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Textfield(context,Colors.white70,'Enter Password',true)
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainHome()));
                          },
                          child: const Text('Login',style: TextStyle(color: Colors.white70,fontSize: 20),))),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                          children: [
                        const TextSpan(text: 'Donot have an account?'),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MySignup()));
                              },
                            text: 'Register Now',
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
                              color: Color(0xff000000)),
                          children: [
                        const TextSpan(text: 'If you'),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             MyPassword()));
                              },
                            text: 'Forget Password',
                            style: const TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xffFA7C2F),
                            ))
                      ]))
                ]),
          ),
        ));
  }
}
