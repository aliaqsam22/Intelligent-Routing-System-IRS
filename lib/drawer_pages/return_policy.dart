import 'package:flutter/material.dart';

class MyReturnPolicy extends StatelessWidget {
  const MyReturnPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 208, 230),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Return Policy ',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
      ),
      body: Text('HELLO'),
    );
  }
}
