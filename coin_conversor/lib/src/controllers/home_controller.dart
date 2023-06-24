import 'package:coin_conversor/src/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {

  //recebendo a lista de valores do currency_model
  late List<CurrencyModel> currencies;

  //get do textField do DOM
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  //variaveis que vão ser usadas para as operações baseada no currency_model importado
  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;

  //get dos valores
  HomeController(){
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert(){

    //convertendo para texto
    String text = toText.text;
    //convertendo para double
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    // ? e ! por conta do null safety
    switch (toCurrency?.name) {
        case "Real" :
        returnValue = value * toCurrency!.real;
        case "Dolar" :
        returnValue = value * toCurrency!.dolar;
        case "euro" :
        returnValue = value * toCurrency!.euro;
        case "bitcoin" :
        returnValue = value * toCurrency!.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }



}