import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utills/toast.dart';
import 'round_button.dart';

class MyForgotPassword extends StatefulWidget {
  const MyForgotPassword({super.key});

  @override
  State<MyForgotPassword> createState() => _MyForgotPasswordState();
}

class _MyForgotPasswordState extends State<MyForgotPassword> {
  TextEditingController emailcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 39,
            ),
            RoundBut(
                title: "SEnd",
                loading: loading,
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  _auth
                      .sendPasswordResetEmail(
                          email: emailcontroller.text.toString())
                      .then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utills().ToastMessage(
                        'have send you a password please check your email');
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                    });
                    Utills().ToastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
