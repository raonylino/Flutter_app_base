import 'package:flutter/material.dart';

class HomePage2  extends StatelessWidget {
  const HomePage2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20,
                offset: Offset(10, 10)
              )
            ]
          ),
        ),
      ),
    );
  }
}