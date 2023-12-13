

import 'package:flutter/material.dart';
import 'package:mao_namassa/home/home_page.dart';
import 'package:mao_namassa/home/home_page2.dart';
import 'package:mao_namassa/images/images_page.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: HomePage(),
      routes: {
        '/':(_) => HomePage(),
        HomePage2.routeName: (_) => HomePage2() 

      },

    );
  }
}