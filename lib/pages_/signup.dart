// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import '../widgets/textfield.dart';
// import 'login.dart';

// class MySignup extends StatefulWidget {
//   const MySignup({super.key});

//   @override
//   State<MySignup> createState() => _MySignupState();
// }

// class _MySignupState extends State<MySignup> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white70,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   const Image(
//                     image: AssetImage('assets/regform.png'),
//                     height: 200,
//                     width: double.infinity,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Textfield(context, Colors.white70, 'UserName', true)
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Textfield(context, Colors.white70, 'Email', true)
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Textfield(context, Colors.white70, 'Password', true)
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Textfield(context, Colors.white70, 'Confirm Password', true)
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                       width: double.infinity,
//                       height: 65,
//                       child: ElevatedButton(

//                           style: ElevatedButton.styleFrom(

//                               backgroundColor: Colors.black,
//                               textStyle: const TextStyle(fontSize: 20)),
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               // If the form is valid, display a snackbar. In the real world,
//                               // you'd often call a server or save the information in a database.
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('Processing Data')),
//                               );
//                             }
//                           },
//                           child: const Text('Register',style: TextStyle(color: Colors.white70),))),
//                   const SizedBox(
//                     height: 37,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   RichText(
//                       text: TextSpan(
//                           style: const TextStyle(
//                               fontFamily: 'Urbanst',
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xff000000)),
//                           children: [
//                         const TextSpan(text: 'Already have an account?'),
//                         TextSpan(
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => const MyLogin()));
//                               },
//                             text: 'Login Now',
//                             style: const TextStyle(
//                               fontFamily: 'Urbanst',
//                               fontSize: 18,
//                               fontWeight: FontWeight.w900,
//                               color: Color(0xffFA7C2F),
//                             ))
//                       ]))
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:osm_map/Utills/toast.dart';
import 'package:osm_map/pages_/login.dart';

import 'round_button.dart';

class MySign extends StatefulWidget {
  const MySign({super.key});

  @override
  State<MySign> createState() => _MyLoginState();
}

class _MyLoginState extends State<MySign> {
  bool loading = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void signup() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _auth
          .createUserWithEmailAndPassword(
              email: emailcontroller.text.toString(),
              password: passwordcontroller.text.toString())
          .then((value) {
        setState(() {
          loading = false;
        });
      }).onError((error, stackTrace) {
        Utills().ToastMessage(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailcontroller,
                    decoration:
                        const InputDecoration(label: Text('Enter Email')),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter value ';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    decoration:
                        const InputDecoration(label: Text('Enter password')),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter value ';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundBut(
                title: 'Sign Up',
                loading: loading,
                ontap: () {
                  signup();
                }),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyLogin()));
                },
                child: const Text(
                    'If You  Have AN ACOUNT then click here for Login'))
          ],
        ),
      ),
    );
  }
}
