import 'package:flutter/material.dart';

import '../models/product.dart';

class PharmaG extends StatelessWidget {
  final List items = [
    Data(image: 'assets/pharmacies.jpg', text: "Pharmacies "),
    Data(image: 'assets/HOMEO11.jpg', text: "Homeopathic "),
    Data(image: 'assets/call pharmacist.jpg', text: " Call Pharmacist "),
    Data(image: 'assets/pp22.png', text: "Physiotherapy ")
  ];
  PharmaG({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 200,
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: const EdgeInsets.all(8.0), // padding around the grid
      itemCount: items.length, // total number of items
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            switch (index) {}
          },
          child: Column(
            children: [
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  color: const Color.fromARGB(255, 227, 208, 230),
                  child: Image.asset(
                    items[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                items[index].text,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      },
    );
  }
}
