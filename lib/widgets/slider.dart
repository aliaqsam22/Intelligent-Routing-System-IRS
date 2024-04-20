import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: const Text('Search for Pharmacy'),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          carouselController: buttonCarouselController,
          items: _imageUrl.map((imagepath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.network(
                    imagepath,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  final _imageUrl = [
    'https://images.unsplash.com/photo-1471864190281-a93a3070b6de?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHNpZ25pbiUyMCUyMGltYWdlcyUyMGNvbXB1dGVyJTIwcGhhcm1hY3l8ZW58MHx8MHx8fDA%3D',
    'https://img.freepik.com/free-photo/copy-space-tablets-with-pills_23-2148506656.jpg?size=626&ext=jpg&ga=GA1.1.182636819.1698931387&semt=ais'
        'https://img.freepik.com/free-photo/high-angle-medical-items-arrangement_23-2149341565.jpg?size=626&ext=jpg&ga=GA1.1.182636819.1698931387&semt=ais',
    'https://img.freepik.com/free-photo/copy-space-tablets-with-daily-pills_23-2148550989.jpg?size=626&ext=jpg&ga=GA1.1.182636819.1698931387&semt=ais',
    'https://img.freepik.com/free-photo/glass-water-pills-desk_23-2148551003.jpg?size=626&ext=jpg&ga=GA1.1.182636819.1698931387&semt=ais',
    'https://img.freepik.com/free-photo/empty-drugstore-with-bottles-packages-full-with-medicaments-retail-shop-shelves-with-pharmaceutical-products-pharmacy-space-filled-with-medical-drugs-pills-vitamins-boxes_482257-62215.jpg?size=626&ext=jpg&ga=GA1.1.182636819.1698931387&semt=ais',
    'https://img.freepik.com/free-photo/smiling-young-female-doctor-wearing-medical-robe-stethoscope-sitting-desk-with-medical-tools-looking-holding-arrow-mark-pointing-side-isolated_141793-68608.jpg?size=626&ext=jpg&ga=GA1.1.182636819.1698931387&semt=ais',
    'https://img.freepik.com/free-photo/unrecognizable-female-doctor-with-laptop-holding-medication-writing-prescription_1098-17464.jpg?size=626&ext=jpg&ga=GA1.1.182636819.1698931387&semt=ais',
  ];
}
