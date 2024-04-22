import 'package:flutter/material.dart';

class AutoCompleteSearch extends StatelessWidget{
  late TextEditingController texteditingcontroller;
  AutoCompleteSearch({required this.texteditingcontroller});
  static const List<String> listitems=<String>[
    "apple",
    "bnana",
    "mango",
  ];
  @override
  Widget build(BuildContext context) {
  return Autocomplete(optionsBuilder: (TextEditingValue texteditingcontroller){
    if(texteditingcontroller.text==''){
      return const Iterable<String>.empty();
    }
    return listitems.where((String item){
      return item.contains(texteditingcontroller.text.toLowerCase());
    });
  },
  onSelected: (String item){
    print('The $item was selected');
  },
  );
  }


}