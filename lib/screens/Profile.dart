import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('هنا معلوماتك الشخصية'),
        backgroundColor: const Color(0xFF3D6643),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Welcome to My Profile Page',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}