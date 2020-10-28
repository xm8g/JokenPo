import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");

  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedra, Papel e Tesoura'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Escolha do App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Image(image: this._imagemApp),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Escolha uma opção abaixo",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset('imagens/pedra.png', height: 100)),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset('imagens/papel.png', height: 100)),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset('imagens/tesoura.png', height: 100)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_resultado, style: TextStyle(fontSize: 32),)
              ],
            )
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {});
  }

  void _opcaoSelecionada(String opcao) {
    var opcoes = ["pedra", "papel", "tesoura"];
    int indice = Random().nextInt(3);
    String escolhaDoApp = opcoes[indice];

    setState(() {
      _imagemApp = AssetImage("imagens/$escolhaDoApp.png");
      String analise;
      if (escolhaDoApp == "pedra") {
        if (opcao == "papel") {
          analise = "true";
        } else if (opcao == "pedra") {
          analise = null;
        } else {
          analise = "false";
        }
      } else if (escolhaDoApp == "papel") {
        if (opcao == "tesoura") {
          analise = "true";
        } else if (opcao == "papel") {
          analise = null;
        } else {
          analise = "false";
        }
      } else if (escolhaDoApp == "tesoura") {
        if (opcao == "pedra") {
          analise = "true";
        } else if (opcao == "tesoura") {
          analise = null;
        } else {
          analise = "false";
        }
      }

      if (analise != null) {
        _resultado = analise == "true" ? "Você Ganhou!!" : "Você Perdeu!!!!";
      } else {
        _resultado = "EMPATE!!";
      }
    });

  }
}
