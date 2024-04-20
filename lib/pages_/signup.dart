import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/textfield.dart';
import 'login.dart';


class MySignup extends StatefulWidget {
  const MySignup({super.key});

  @override
  State<MySignup> createState() => _MySignupState();
}

class _MySignupState extends State<MySignup> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/regform.png'),
                    height: 200,
                    width: double.infinity,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Textfield(context, Colors.white70, 'UserName', true)
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Textfield(context, Colors.white70, 'Email', true)
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Textfield(context, Colors.white70, 'Password', true)
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Textfield(context, Colors.white70, 'Confirm Password', true)
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: ElevatedButton(
                        
                          style: ElevatedButton.styleFrom(
                           
                              backgroundColor: Colors.black,
                              textStyle: const TextStyle(fontSize: 20)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Register',style: TextStyle(color: Colors.white70),))),
                  const SizedBox(
                    height: 37,
                  ),
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
                        const TextSpan(text: 'Already have an account?'),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MyLogin()));
                              },
                            text: 'Login Now',
                            style: const TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xffFA7C2F),
                            ))
                      ]))
                ],
              )),
        ),
      ),
    );
  }
}
