import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print("Escolha do APP: " + escolhaApp);
    print("Escolha do usuario: " + escolhaUsuario);
    _imagemApp =  AssetImage("images/$escolhaApp.png");
    setState(() {
    });
//    switch (escolhaApp) {
//      case "pedra":
//        setState(() {
//          AssetImage("images/pedra.png");
//        });
//        break;
//      case "papel":
//        setState(() {
//          AssetImage("images/papel.png");
//        });
//        break;
//      case "tesoura":
//        setState(() {
//          AssetImage("images/tesoura.png");
//        });
//        break;
//    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra"))
      setState(() {
        this._mensagem = "Parabéns! Você ganhou :)";
      });
    else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra"))
      setState(() {
        this._mensagem = "Que pena! Você perdeu :(";
      });
    else {
      setState(() {
        this._mensagem = " Houve um empate!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            " Escolha do App",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Image(image: this._imagemApp),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(this._mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Text("Resultado"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _opcaoSelecionada("pedra");
              },
              child: Image.asset(
                "images/pedra.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                _opcaoSelecionada("papel");
              },
              child: Image.asset(
                "images/papel.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                _opcaoSelecionada("tesoura");
              },
              child: Image.asset(
                "images/tesoura.png",
                height: 100,
              ),
            ),
          ],
        )
        //image
        //text
      ]),
    );
  }
}
