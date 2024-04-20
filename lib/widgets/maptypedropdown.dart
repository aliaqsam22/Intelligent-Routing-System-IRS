import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<Dropdown> {
   int groupvalue=1;
  @override
  Widget build(BuildContext context) {

      return Container(
          child: Container(
          child: RadioListTile(
          title: Text(
          'hj',
          style: TextStyle(fontSize: 20.0),
    ),
    activeColor: Colors.black,
    value:1 ,
    groupValue: groupvalue,
    onChanged: (value) {

    }
    )
          )
      );
  }
}
