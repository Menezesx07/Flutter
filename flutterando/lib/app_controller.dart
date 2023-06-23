import 'package:flutter/material.dart';

//variavel global do flutter, chamada no MyApp pelo AnimatedBuilder
//linha 20 é o operador ternario para o isDartTheme (variavel global)
//linha 54 com o switch para fazer o false/true
//static app controler para poder chamar a função glboalmente
class AppController extends ChangeNotifier{

  static AppController instance = AppController();

  bool isDarkTheme = false;

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners(

    );
  }


}