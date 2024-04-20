import 'package:flutter/material.dart';

class MytermC extends StatelessWidget {
  const MytermC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 208, 230),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Term and Condition ',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '1. Acceptance of Terms:',
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
                  'By downloading, installing, or using the Health pill pharmacy App (the App), you agree to comply with and be bound by the following terms and conditions ("Terms"). If you do not agree to these Terms, please do not use the App.',
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
                  '2. Eligibility:',
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
                  'You must be at least 18 years old to use the Health pill pharmacy App, you confirm that you meet this age requirement.',
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
                  '3. User Accounts: ',
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
                  'The Health pill Pharmacy App provides access to pharmaceutical products and related services.'
                  'You agree to use the App only for lawful purposes and in compliance with all applicable laws and regulations '
                  'You will not use the App for any illegal or unauthorized purpose. You agree to provide accurate and complete information when creating an account and to update your information to keep it accurate and current.',
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
                  '4. Prescription Medications: ',
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
                  'a. The App may facilitate the purchase of prescription medications. You agree to provide accurate prescription information, and you acknowledge that prescription medications will only be dispensed with a valid prescription from a licensed healthcare professional.',
                  style: TextStyle(
                    fontFamily: 'Urbanst',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'b. You are responsible for consulting with a healthcare professional to ensure the appropriateness of the prescribed medication.',
                    style: TextStyle(
                      fontFamily: 'Urbanst',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '5.  Privacy Policy: ',
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
                  ' Your use of the App is also governed by our Privacy Policy, which can be found at privacy policy. By using the App, you consent to the collection and use of your information as described in privacy policy.'
                  ' Please review our Privacy Policy to understand how we collect, use, and disclose information.',
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
                  '6. User Accounts: ',
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
                  ' You may be required to create a user account to access certain features of the App.'
                  ' You are responsible for maintaining the confidentiality of your account login information and for any activity that occurs under your account.',
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
                  '7. Ordering and Payment :',
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
                  'The App provides information on available products and facilitates the ordering process.'
                  'Payment for orders will be processed through secure payment methods, and you agree to provide accurate payment information.',
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
                  '8. Termination:',
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
                  'We reserve the right to terminate or suspend your account and access to the App for violation of these terms or any applicable laws.'
                  'You may terminate your account at any time by following the instructions of customer support.',
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
                  ' 9. Contact Information:',
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
                  'For inquires and assistance, you may contact us at healthpill@outlook.com',
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
