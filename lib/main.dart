import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int playerWins = 0;
  int computerWins = 0;
  String resultMessage = '';
  String playerChoice = '';
  String computerChoice = '';

  void _playGame(String choice) {
    setState(() {
      playerChoice = choice;
      computerChoice = _generateComputerChoice();
      resultMessage = _determineWinner(playerChoice, computerChoice);
    });
  }

  String _generateComputerChoice() {
    List<String> choices = ['Pedra', 'Papel', 'Tesoura'];
    return choices[Random().nextInt(choices.length)];
  }

  String _determineWinner(String playerChoice, String computerChoice) {
    if (playerChoice == computerChoice) {
      return 'Empate!';
    } else if ((playerChoice == 'Pedra' && computerChoice == 'Tesoura') ||
        (playerChoice == 'Papel' && computerChoice == 'Pedra') ||
        (playerChoice == 'Tesoura' && computerChoice == 'Papel')) {
      playerWins++;
      return 'Você ganhou!';
    } else {
      computerWins++;
      return 'O computador ganhou!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('||||||||||||||| - BOM JOGO - |||||||||||||||'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Centralizando o título
            Text(
              'Pedra | Papel | Tesoura',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Centralizando o texto
            ),
            SizedBox(height: 40),
            Text(
              'Escolha uma opção:',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildChoiceButton('Pedra', Icons.gavel),
                _buildChoiceButton('Papel', Icons.description),
                _buildChoiceButton('Tesoura', Icons.content_cut),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Você escolheu: $playerChoice',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Computador escolheu: $computerChoice',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              resultMessage,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              'Placar:',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              'Você: $playerWins | Computador: $computerWins',
              style: TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }

  // Função para criar o botão com CircleAvatar
  Widget _buildChoiceButton(String choice, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => _playGame(choice),
        child: CircleAvatar(
          radius: 30, // Define o tamanho do botão
          backgroundColor: Colors.blueAccent, // Cor de fundo
          child: Icon(
            icon, // Ícone de acordo com a escolha
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
