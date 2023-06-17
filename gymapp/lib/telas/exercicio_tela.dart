import 'package:flutter/material.dart';
import 'package:flutter_gymapp/modelos/exercicio_modelo.dart';

import '../_comum/minhas_cores.dart';
import '../modelos/sentimento_modelo.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  //objeto estatico
  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "ex001",
      name: "Remada Baixa",
      treino: "Treino A",
      comoFazer: "Segura a barra e puxa");

  //lista dos sentimentos que pode ter varios (sentimentos in sentimentos)
  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(id: "Se001", sentindo: "Pouca Ativação", data: "2023-06-01"),
    SentimentoModelo(id: "Se002", sentindo: "Muita Ativação", data: "2023-06-01"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: MinhasCores.amarelo,


      //AppBar                        //interpolação
        appBar: AppBar(
          title: Column(children: [
            Text(exercicioModelo.name,
                style: const TextStyle(
                    color: Colors.white,
                      fontWeight: FontWeight.bold,
                ),
            ),
            Text(exercicioModelo.treino, style: const TextStyle(
                color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ]),

            backgroundColor: Theme.of(context).colorScheme.inversePrimary, //cor por conta do material U
            centerTitle: true,
            toolbarHeight: 72,
        ),

      //FloatingActionButton - botão flutuante
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("botão clicado");
      },
        child: const Icon(Icons.add)
      ),

        //body -----------------------
        body: Container( //pra colocar esse container, clica no "collum" depois na lampada, e container
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
          ),
          child: ListView(

            //lista de widgets do body
            children: [

            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){},
                      child: const Text("Enviar Foto")
                  ),
                  ElevatedButton(onPressed: (){}, child: const Text("Tirar Foto"))
                ],
              ),
            ),

            const SizedBox(height: 10),

            const Text("Como Fazer ?", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
                ),
              ),

              const SizedBox(height: 10),

             Text(exercicioModelo.comoFazer),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),

            const Text("Como Me Sentindo ?", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
            ),

              const SizedBox(height: 10),

            Column(

              //flex-direction - flex-start
              crossAxisAlignment: CrossAxisAlignment.start,

              //index vai ser o valor atual do .lenght[i]
              children: List.generate(listaSentimentos.length, (index) {

                SentimentoModelo sentimentoAgora = listaSentimentos[index];

                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                        title: Text(sentimentoAgora.sentindo),
                        subtitle: Text(sentimentoAgora.data),
                        //começo do widget
                        leading: const Icon(Icons.double_arrow),
                        //final do widget
                        trailing: IconButton(
                          icon: 
                          const Icon(Icons.delete, 
                            color: Colors.black,), 
                          onPressed: () { 
                            print("Deletar ${sentimentoAgora.sentindo}");
                          },
                        ),
                );
              }),
            )




          ],
          ),
        ),


       //body -------------------------

    );
  }
}