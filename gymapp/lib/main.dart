flutterfire configureimport 'package:flutter/material.dart';
import 'package:flutter_gymapp/telas/autenticacao_tela.dart';
import 'package:flutter_gymapp/telas/exercicio_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(0, 252, 204, 59)),
        useMaterial3: true,
      ),


      home: AutenticacaoTela(),
    );
  }
}


