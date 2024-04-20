import 'package:flutter/material.dart';
import '../gridveiw_in-project/callgrid.dart';
import '../gridveiw_in-project/nutrition.dart';
import '../gridveiw_in-project/pharmacygrid.dart';
import '../gridveiw_in-project/phyiogrid.dart';
import '../models/product.dart';

import '../gridveiw_in-project/homopathgrid.dart';

class MyGrid extends StatelessWidget {
  final List items = [
    Data(image: 'assets/ppharmacy.png', text: "Pharmacies "),
    Data(image: 'assets/herbal medicine .png', text: "Homeopathic "),
    Data(image: 'assets/worried calling doctor.png', text: " Call Pharmacist "),
    Data(image: 'assets/physiotherpist.png', text: "Physiotherapy "),
    Data(image: 'assets/nutrinisttt.png', text: "Nutritionist "),
    Data(image: 'assets/skincare.png', text: "Skin Care ")
  ];
  MyGrid({super.key});

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
            switch (index) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PharmaG()));

                break;
              case 1:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomoG()));

                break;
              case 2:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CallG()));

                break;
              case 3:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PhysioG()));

                break;
              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyNutrition()));

                break;
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  color: const Color.fromARGB(255, 227, 208, 230),
                  child: Image.asset(
                    items[index].image,
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
