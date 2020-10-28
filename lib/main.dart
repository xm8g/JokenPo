import 'package:flutter/material.dart';

import 'jogo.dart';

void main() {
  runApp(Jokenpo());
}

class Jokenpo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedra, Papel e Tesoura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Jogo(),
    );
  }
}


