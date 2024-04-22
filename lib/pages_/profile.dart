import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
             child: Icon(Icons.verified_user),
            ),
            SizedBox(height: 20),
            Text(
              'Ali Aqsam',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Software Engineer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('aliaqsam216@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+1 123-456-7890'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to edit profile
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}