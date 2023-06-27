import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/minhas_cores.dart';

InputDecoration getAuthenticationInputDecoration(String Label) {
  return InputDecoration(
    //hint text para
    hintText: Label,
    //fill color é o preenchimento, e tem de ser passado como true no filled
    fillColor: Colors.white,
    filled: true,
    contentPadding:  const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: const BorderSide(color: Colors.black, width: 2)
    ),
    
    //borda em que está sendo focado
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: const BorderSide(color: MinhasCores.amarelo, width: 3)
    ),

    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: const BorderSide(color: Colors.red, width: 3)
    ),

  );
}