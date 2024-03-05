import 'package:flutter/material.dart';
import 'package:helo_convite/pages/home_two.dart';

class ConfirmationsPage extends StatelessWidget {
  const ConfirmationsPage({super.key});

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
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/canvei.gif',
                    height: MediaQuery.of(context).size.height * 0.24,
                  ),
                  Image.asset(
                    'assets/images/canvei.gif',
                    height: MediaQuery.of(context).size.height*0.24,
                  ),
                  Image.asset(
                    'assets/images/canvei.gif',
                    height: MediaQuery.of(context).size.height*0.24,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Se chegou até aqui é pq aceitou o convite :)!!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Me envie uma mensagem falando se gostou do convite ou aguarde uma minha!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Vamos combinar tudo certinho pra sair ótimo!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Vamos nos divertir!!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/canvei.gif',
                    height: MediaQuery.of(context).size.height*0.24,
                  ),
                  Image.asset(
                    'assets/images/canvei.gif',
                    height: MediaQuery.of(context).size.height*0.24,
                  ),
                  Image.asset(
                    'assets/images/canvei.gif',
                    height: MediaQuery.of(context).size.height*0.24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
