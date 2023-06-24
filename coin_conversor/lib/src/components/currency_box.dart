import 'package:flutter/material.dart';

const List<String> list = <String>["Real", "Dolar", "Euro", "Bitcoin"];

class CurrencyBox extends StatefulWidget {
  const CurrencyBox({super.key});

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {

  String dropdownValue = list.first;


  @override
  Widget build(BuildContext context) {
    return    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          //criando o dropdown, tem de ser statefull
          child: SizedBox(
            height: 56,
            child: DropdownButton<String>(
              iconEnabledColor: Colors.amber,
              value: dropdownValue,
              elevation: 16,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),

              //if else para abrir ele
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },

              //lista dos items setados fora da class
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

        ),

        //espaçamento na horizontal
        const SizedBox(width: 30),

        Expanded(
          flex: 3,
          child: TextFormField(
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber))
            ),
          ),
        )
      ],
    );
  }
}


