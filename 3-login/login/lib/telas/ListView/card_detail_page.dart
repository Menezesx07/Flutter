import 'package:flutter/material.dart';
import 'package:login/model/cardDetail.dart';

class cardDetailPage extends StatelessWidget {
  const cardDetailPage({super.key, required this.cardDetail});

  //recebendo os dados da "card_page"
  final CardDetail cardDetail;

  @override
  Widget build(BuildContext context) {
    return Hero(

      //recebendo a tag (index) do item para animação
      //pois ele vai ser basear no tamanho do card para fazer o efeito de recuo
      tag: cardDetail.id,

      child: Scaffold(
        body: Padding(
          //padding do texto para a borda do card
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.close)),
              Row(
                children: [
                  Image.network(cardDetail.url,
                      height: 100),
                ],
              ),


              Text(cardDetail.title,
                      style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700)),

              const SizedBox(height: 10),

              //o expanded é para que na hora que esse componente seja chamado
              //ele vá "abrindo" gradativamente
              Expanded(
                child: Text(cardDetail.text,
                  textAlign: TextAlign.justify,
                ),
              ),

              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}
