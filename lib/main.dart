import 'package:bagstore/screen/dasboard.dart';
import 'package:bagstore/screen/login.dart';
import 'package:bagstore/screen/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/CameraGalleryScreen':(context) => const CameraGalleryScreen(),
      },

    ),
    );
}

