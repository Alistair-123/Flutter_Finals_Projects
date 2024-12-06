import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  'assets/images/1.jpeg'), // Add image in 'assets' folder
            ),
            SizedBox(height: 20),
            Text('Your Name', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
