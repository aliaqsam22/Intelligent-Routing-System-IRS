import 'package:flutter/material.dart';

class MyFeedBack extends StatelessWidget {
  const MyFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
    );
  }
}
