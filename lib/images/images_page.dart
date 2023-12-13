import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagens'),
      ),
      body: Center(
          child: Container(
        width: 300,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image/moto.jpeg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            'Yamaha R9',
            style: TextStyle(backgroundColor: Colors.white.withOpacity(0.5), fontSize: 20),
          ),
        ),
      )),
    );
  }
}
