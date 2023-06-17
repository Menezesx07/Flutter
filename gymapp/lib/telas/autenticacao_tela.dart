import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/minhas_cores.dart';

class AutenticacaoTela extends StatelessWidget {
  const AutenticacaoTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.amarelo,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              MinhasCores.amareloGradienteTop,
              MinhasCores.amareloGradienteDown
            ],
            ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,    //alinhando na vertical
            crossAxisAlignment: CrossAxisAlignment.stretch, //alinhando na horizontal
            children: [
              Image.asset("assets/logo.png",height: 128),
              const Text("GymApp",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),)
            ],
          ),
        ],
      ),


    );
  }

}

