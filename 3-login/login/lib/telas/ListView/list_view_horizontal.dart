import 'package:flutter/material.dart';

import '../../shared/images/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(

            flex: 2,

            child: ListView(

            //fazendo o scroll na horizontal
            scrollDirection: Axis.horizontal,

            children: [
              //não precisa colocar o tamanho da imagem,
              //pois o proprio List ja faz isso com o expanded
              Card(elevation: 8, child: Image.asset(AppImages.paisagem1)),
              Card(elevation: 8, child: Image.asset(AppImages.paisagem2)),
              Card(elevation: 8, child: Image.asset(AppImages.paisagem3)),
            ],
        ),
       ),

       //criando um espaço em branco em baixo para deixar menor a imagem
       //e o flex tá para fazer a proporção, sendo 2 pra cima e 3 pra baixo (dividindo a coluna em 5)
       Expanded(flex: 3, child: Container(

       ))
      ]
      ),
    );
  }
}
