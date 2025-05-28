import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart'; // ganti sesuai file homepage kamu

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TasbihHomePage(title: 'Tasbih Digital')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ganti Icon dengan Image.asset logo
            Image.asset(
              'assets/images/patitech.png',
              width: 320,
              height: 320,
            ),
            const SizedBox(height: 20),
            const Text(
              'Tasbih Digital',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 27, 154, 1),
                fontFamily: 'Scheherazade', // optional
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mengingat Allah Dimanapun Kamu Berada',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(179, 2, 132, 41),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
