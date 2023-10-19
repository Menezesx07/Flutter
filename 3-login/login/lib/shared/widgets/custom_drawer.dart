import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:login/repositories/back4app/tarefas_back4app_repository.dart';
import 'package:login/repositories/marvel/marvel_repository.dart';
import 'package:login/telas/Drawer/posts_pages.dart';
import 'package:login/telas/ListView/tarefa_http_page.dart';
import 'package:login/telas/login.dart';

import '../../telas/Drawer/dadosCadastrais.dart';

class customDrawer extends StatelessWidget {
  const customDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 20),


          InkWell(
            onTap: () {
              //modal que aparece de baixo para cima (algo parecido com o "compartilhar"
              showModalBottomSheet(context: context, builder: (BuildContext bc) {
                //wrap deixa a modal pequena
                return  Wrap(
                  children: [
                    ListTile(
                      title: const Text("Camera"),
                      leading: const Icon(Icons.camera_alt_outlined),
                      onTap: () => Navigator.pop(context),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("Galeria"),
                      leading: const Icon(Icons.photo_album_outlined),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                );
              });
            },
            child: UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.transparent),
                currentAccountPicture: Image.network("https://play-lh.googleusercontent.com/P3xTS7gQrh0S2e_99KmHVGiVUcvepvj4eFFhqU_y6XFRegRoo1fTZ8r6t1MUsmfRxXNJ"),
                accountName: const Text("Rafael Henrique", style: TextStyle(color: Colors.black),),
                accountEmail: const Text("Rafael@henrique", style: TextStyle(color: Colors.black)),

            ),
          ),

          const SizedBox(height: 10),
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.task_alt_outlined),
                  SizedBox(width: 10),
                  Text("Tasks Htpp"),
                ],
              ),
            ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => tarefaHttpPage()));
            },

          ),

          //Posts
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.post_add_outlined),
                    SizedBox(width: 10),
                    Text("Posts"),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostsPage(),));
            },

          ),

          const SizedBox(height: 10),
          InkWell(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.hevc_rounded),
                    SizedBox(width: 10),
                    Text("Herois"),
                  ],
                ),
              ),
            ),
            onTap: () async {
              var marvelRepository = MarvelRepository();
              var heroes = await marvelRepository.getCharacters();
              print(heroes);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => PostsPage(),));
            },

          ),

          const SizedBox(height: 10),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity, //a animação ocupa o bloco completo
                  child: const Row(
                    children: [
                      Icon(Icons.person_outline),
                      SizedBox(width: 10),
                      Text("Dados Cadastrais"),
                    ],
                  )),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const dadosCadastrais(label: "Meus Dados")));
            },
          ),


          //termos de uso
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 10),
                    Text("Termos de Uso"),
                  ],
                ),
              ),
            ),
            onTap: () {
            showModalBottomSheet(context: context, builder: (BuildContext bc) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("Termos de uso", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text(" Podemos já vislumbrar o modo pelo qual o início da atividade geral de formação de atitudes nos obriga à análise das condições financeiras e administrativas exigidas. Percebemos, cada vez mais, que a mobilidade dos capitais internacionais prepara-nos para enfrentar situações atípicas decorrentes das novas proposições. Assim mesmo, a consolidação das estruturas exige a precisão e a definição das posturas dos órgãos dirigentes com relação às suas atribuições. A certificação de metodologias que nos auxiliam a lidar com a crescente influência da mídia facilita a criação de todos os recursos funcionais envolvidos. O cuidado em identificar pontos críticos no novo modelo estrutural aqui preconizado maximiza as possibilidades por conta do processo de comunicação como um todo."),
                  ],
                ),
              );
            });
            },
          ),


          const SizedBox(height: 10),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity, //a animação ocupa o bloco completo
                  child: const Row(
                    children: [
                      Icon(Icons.album_outlined),
                      SizedBox(width: 10),
                      Text("Configurações"),
                    ],
                  )),
            ),
            onTap: () {},
          ),

          //botão de Sair
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app_outlined),
                    SizedBox(width: 10),
                    Text("Sair"),
                  ],
                ),
              ),
            ),

            onTap: () {
              showDialog(context: context, builder: (BuildContext bc) {
               return AlertDialog(
                 title: const Text("Sair", style: TextStyle(fontWeight: FontWeight.bold),),
                 content: const Wrap(
                   children: [
                     Divider(),
                     Text("Você Realmente Deseja Sair ?")
                   ],
                 ),
                 actions: [
                   OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                   FilledButton(onPressed: () => Navigator.pushReplacement(context,
                   MaterialPageRoute(builder: (context) => const LoginPage())), child: const Text('Sair')),
                 ],
               );
              });
            },
          )

        ],
      ),
    );
  }
}
