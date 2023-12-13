import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  static const String routeName = '/home_page2';
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30), boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 20, offset: Offset(10, 10))]),
        ),
      ),
    );
  }
}
