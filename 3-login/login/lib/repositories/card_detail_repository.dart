import '../model/cardDetail.dart';

class CardDetailRepository {

  //simulando um, delay de um Rest
  Future<CardDetail> get () async {
   await Future.delayed(Duration(seconds: 3));
    return CardDetail(
        1,
        "Meu Card",
        "https://play-lh.googleusercontent.com/P3xTS7gQrh0S2e_99KmHVGiVUcvepvj4eFFhqU_y6XFRegRoo1fTZ8r6t1MUsmfRxXNJ",
        "É importante questionar o quanto a percepção das dificuldades oferece uma interessante oportunidade para verificação dos métodos utilizados na avaliação de resultados. No entanto, não podemos esquecer que a competitividade nas transações comerciais afeta positivamente a correta previsão das novas proposições."
    );
  }
}