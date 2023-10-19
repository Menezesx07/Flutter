import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:login/model/via_cep_model.dart';
import 'package:login/repositories/via_cep_repository.dart';

class consultaCep extends StatefulWidget {
  const consultaCep({super.key});

  @override
  State<consultaCep> createState() => _testeHttpState();
}

class _testeHttpState extends State<consultaCep> {

  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viaCepModel = ViaCepModel();
  var viaCepRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            children: [
              const Text("Consulta de Cep", style: TextStyle(fontSize: 22)),
              TextField(
                controller: cepController,
                maxLength: 8,
                keyboardType: TextInputType.number,
                onChanged: (String value) async{
                  //RegExp remove tudo que é simbolo, dexando vazio '', pegando só os numeros
                  var cep = value.trim().replaceAll(RegExp(r'[^0-9]'), '');
                  if(cep.length == 8) {
                    setState(() {
                      loading = true;
                    });

                    viaCepModel = await viaCepRepository.getCep(cep);

                  }
                  setState(() {
                    loading = false;
                  });
                },
              ),
              const SizedBox(height: 50),
               Text(viaCepModel.logradouro ?? "", style: const TextStyle(fontSize: 22)),
               Text("${viaCepModel.localidade ?? ""} - ${viaCepModel.uf ??""}", style: const TextStyle(fontSize: 22)),

              Visibility(
                visible: loading,
                  child: const CircularProgressIndicator()
              )

            ],
          ),
        ),



        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async{


            }),


      )
    );
  }
}
