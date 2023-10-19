import 'package:flutter/material.dart';

import '../../shared/images/app_images.dart';

class listViewPage extends StatelessWidget {
  const listViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        //list tile é uma especie de card, mas de forma resumida (bloco)
         ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuário 2"),

          //subtitle com o row é para colocar o horario no final
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá! Tudo Bem ?"),
              Text("08:59")
            ],
          ),

          //trailind são os 3 pontinhos a direita
          trailing: PopupMenuButton<String>(

            //para fazer tal função ao clicar em tal tecla, pode ser
            //usado um if(opcao1) => ou até mesmo um Switch
            onSelected: (menu) => print(menu),

            //semelhante ao listView da navigation bar
            itemBuilder: (BuildContext  bc) {
              return <PopupMenuEntry<String>> [

                const PopupMenuItem<String>( value: "opcao1", child: Text("Opção 1")),
                const PopupMenuItem<String>( value: "opcao2", child: Text("Opção 2")),
                const PopupMenuItem<String>( value: "opcao3", child: Text("Opção 3")),

              ];
            },
          ),


        ),
        Image.asset(AppImages.user1, height: 50),
        Image.asset(AppImages.user2, height: 50),
        Image.asset(AppImages.user3, height: 50),
        //double.infinity ocupa toda a lateral
        Image.asset(AppImages.paisagem1, width: double.infinity),
        Image.asset(AppImages.paisagem2, width: double.infinity),
        Image.asset(AppImages.paisagem3, width: double.infinity),
      ],
    );
  }
}
