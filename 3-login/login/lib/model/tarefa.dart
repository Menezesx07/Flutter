import 'package:flutter/cupertino.dart';

class Tarefa {

  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  String get getId => _id;

  String get getDescricao => _descricao;

  set setDescricao(String value) {
    _descricao = value;
  }

  bool get getConcluido => _concluido;

  void setConcluido(bool concluido) {
    _concluido = concluido;
  }

  //não precisa passar o id pois é automatico
  Tarefa(this._descricao, this._concluido);






}