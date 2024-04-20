import 'package:flutter/material.dart';

class MyPrivacy extends StatelessWidget {
  const MyPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 227, 208, 230),
        appBar: AppBar(
          title: const Text(
            'Privacy Policy',
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '1.Introduction',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Welcome to Health Pill This privacy policy designed to help you understand how we collect, use, disclose, and safeguard your personal information when you use our pharmacy app. We are committed to protecting your privacy and ensuring the security of your personal data.',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '2. Information We Collect ',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'User-provided information:'),
                        TextSpan(
                            text:
                                ' we may collect personal information that you voluntarily provide to us when using the app, including but not limited to your name, contact number, prescription details, and payment information. ',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'Automatically collected information: '),
                        TextSpan(
                            text:
                                ' we may automatically collect certain information when you use our app, such as your device information, usage data, and location information (if you grant us permission).',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '3. How we use your information  ',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'Providing services: '),
                        TextSpan(
                            text:
                                'To provide you with pharmacy services, process prescription and deliver medications.',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'Communication:  '),
                        TextSpan(
                            text:
                                ' To communicate with you regarding your orders, account updates, and important app-related information',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'Improvement: '),
                        TextSpan(
                            text:
                                'To improve our app functionality, user experience, and customer service.',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'Marketing:  '),
                        TextSpan(
                            text:
                                'To send you promotional materials and offers with your consent',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '4. Data Security',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    ' We implement strict security measures to protect your data from unauthorized access or disclosure. ',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '5. Disclosure of your information:   ',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'We may share your personal information with:',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'Pharmacy Partners:'),
                        TextSpan(
                            text: 'To fulfill your prescription orders.',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'Service providers:  '),
                        TextSpan(
                            text:
                                '  To assist us in providing and maintaining our services.',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          children: [
                        TextSpan(text: 'Legal Requirement: '),
                        TextSpan(
                            text:
                                'In response to legal request, if required by law, or to protect our rights, privacy, safety, and property.',
                            style: TextStyle(
                              fontFamily: 'Urbanst',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ))
                      ])),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '6. Changes to this Privacy Policy',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'We may update this privacy policy to reflect changes in our data practices or legal requirements. Any changes will be posted on this page, and the Effective Date will be updated accordingly.',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '7. Contact Us',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    ' If you have any questions or concerns about this Privacy Policy or data practices, please contact us at healthpill@outlook.com',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ])),
        ));
  }
}
