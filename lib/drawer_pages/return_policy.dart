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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '1.Return for Medications:',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Prescription Medications: Due to health and safety regulations, prescription medications are typically not eligible for returns or refunds once they have been dispensed or shipped. '
                  'Over-the-counter (OTC) Medications: Unopened and unused OTC medications may be eligible for returns within a specified time frame (e.g, 2 days)'
                  'from the date of purchase. The packaging must be intact, and the product must be in its original, unopened condition. ',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '2.Returns for Medical Supplies and Equipment: ',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Medical supplies and equipment may be eligible for return within a specified time frame (e.g., 2 days) from the date of purchase'
                  'provided they are in their original, unopened packaging and unused. ',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '3.Refunds and Exchange: ',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'If you are eligible for a return, you may have the option to receive a refund for the purchase price of the returned item or exchange it for a similar product.'
                  'Refunds are typically processed using the original payment method used for purchase.'
                  'If you want to return without any reason there is 5% charges.',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '4.Return Process: ',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'To initiate a return, you may need to contact our app’s customer support and '
                  'follow the instruction provided by customer support representative.'
                  'You may be required to provide proof of purchase, such as an order number or receipt.',
                  style: TextStyle(
                    fontFamily: 'Urbanst',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '5.Exception and special cases:  ',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'The return policy may specify certain exceptions or conditions for specific products or situations. Some items, such as cold chain items may not be eligible for returns.',
                  style: TextStyle(
                    fontFamily: 'Urbanst',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '6.Damage or incorrect orders: ',
                  style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'If you receive damage, defective or incorrect items the return policy should detail the steps to take to resolve these issues which may include replacement or a full refund ',
                  style: TextStyle(
                    fontFamily: 'Urbanst',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
