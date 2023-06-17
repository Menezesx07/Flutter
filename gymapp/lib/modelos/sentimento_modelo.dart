class SentimentoModelo {
  String id;
  String sentindo;
  String data;

  SentimentoModelo({
    required this.id,
    required this.sentindo,
    required this.data
  });

  //transformando o json em string
  SentimentoModelo.fromMap(Map<String, dynamic> map):
        id = map["id"],
        sentindo = map["sentindo"],
        data = map["data"];


  //montando o Json
  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "sentindo": sentindo,
      "data": data,
    };
  }




}