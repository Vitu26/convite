import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helo_convite/pages/confirmations.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final Random random = Random();
  double topPos = 0.0; // Variáveis para armazenar a posição do botão "Não"
  double leftPos = 0.0;
  bool isButtonMoved = false; // Indicador de se o botão foi movido

  @override
  void initState() {
    super.initState();
    // Inicializar as posições para que o botão "Não" comece alinhado com o botão "SIM"
    WidgetsBinding.instance.addPostFrameCallback((_) => setInitialPosition());
  }

  void setInitialPosition() {
    // Definir a posição inicial do botão "Não" para que ele fique alinhado com o botão "SIM"
    final renderBox = context.findRenderObject() as RenderBox;
    final positionSim = renderBox.localToGlobal(Offset.zero);
    setState(() {
      leftPos = positionSim.dx;
    });
  }

  void moveButton() {
    setState(() {
      // Gerar uma posição aleatória dentro dos limites da tela, excluindo a altura e largura do botão
      topPos = random.nextDouble() * (MediaQuery.of(context).size.height - 50);
      leftPos = random.nextDouble() * (MediaQuery.of(context).size.width - 50);
      isButtonMoved = true; // O botão foi movido
    });
  }

  void onSimButtonPressed() async {
    // Referência para a coleção onde os eventos serão armazenados
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');

    // Adiciona um novo evento no Firestore
    try {
      await events.add({
        'event': 'simButtonPressed',
        'timestamp':
            FieldValue.serverTimestamp(), // Pega o timestamp do servidor
      });
      print('Evento registrado com sucesso.');
    } catch (e) {
      print('Erro ao registrar evento: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pinkAccent,
              Colors.purpleAccent,
              Colors.yellowAccent
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Então, Helo!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Acaitas embarcar nessa aventura:!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple, // Cor do texto
                      shape: RoundedRectangleBorder(
                        // Arredondar bordas
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15), // Ajuste o preenchimento
                    ),
                    onPressed: () {
                      onSimButtonPressed();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ConfirmationsPage()));
                    },
                    child: Text('SIM'),
                  ),
                  SizedBox(height: 30),
                  if (!isButtonMoved) // Botão "Não" alinhado com "SIM" antes de se mover
                    ElevatedButton(
                      onPressed: moveButton,
                      child: Text('Não'),
                    ),
                ],
              ),
            ),
            if (isButtonMoved) // Botão "Não" em posição aleatória
              Positioned(
                top: topPos,
                left: leftPos,
                child: ElevatedButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: MaterialStateProperty.all(0),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  onPressed: moveButton,
                  child: Text('Não'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
