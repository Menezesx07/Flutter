import 'package:flutter/material.dart';
import 'package:login/model/cardDetail.dart';
import 'package:login/repositories/card_detail_repository.dart';
import 'package:login/telas/ListView/card_detail_page.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

  //e será chamado dentro do card_detail_page
  //este cardDetail será enviado via Navigation.push atrelado ao inkWell do card
  //foi criado o objeto no "model", está sendo chamado como nulo, pois foi
  //simulado um delay de 3s para ativar a progress indicator
  CardDetail? cardDetail;
  //instanciando o model de cardDetail que vai ser chamado no initState
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //foi criada esta função pois o initState não pode ser async
    carregarDados();
  }

  void carregarDados() async {
    //setando o cardDetail (criado com o ?)
    //o await é por conta do delayt de 3s
    //tem um if ternario na chamada dele na tela,
    //caso for nulo, exibe a progress indicator
    //mas caso ele for preenchido, aí ele é carregado
    //é preciso chamar o setState para avisar do preenchimento da variavel
    cardDetail = await cardDetailRepository.get();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //ocupando toda a lateral
          width: double.infinity,
          child: cardDetail == null ? const LinearProgressIndicator() : InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  cardDetailPage(
                cardDetail: cardDetail!,
              ),));
            },

            //Hero é a transição de tela
            child: Hero(

              //é preciso passar a tag (indice) do item que é passado para o filho
              //pois ele vai ser basear no tamanho do card para fazer o efeito de recuo
              tag: cardDetail!.id,

              child: Card(
                elevation: 8,
                child: Padding(
                  //padding do texto para a borda do card
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(cardDetail!.url,
                              height: 24),
                           Text(cardDetail!.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Text(cardDetail!.text,
                      textAlign: TextAlign.justify,
                      ),

                      const SizedBox(height: 10),

                      Container(
                        alignment: Alignment.centerRight,
                          child: FilledButton(onPressed: () {}, child: Text("Ler Mais")))
                    ],
                  ),
                ),

              ),
            ),
          ),
        ),
      ],
    );
  }
}
