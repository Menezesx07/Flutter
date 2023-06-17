class ExercicioModelo {

  String id;
  String name;
  String treino;
  String comoFazer;

  String? urlImagem;


  ExercicioModelo({
      required this.id,
      required this.name,
      required this.treino,
      required this.comoFazer
  });

  //transformando o json em string
  ExercicioModelo.fromMap(Map<String, dynamic> map):
        id = map["id"],
        name = map["name"],
        treino = map["treino"],
        comoFazer = map["comoFazer"],
        urlImagem = map["urlImagem"];


  //montando o Json
  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "nome": name,
      "treino": treino,
      "comoFazer": comoFazer,
      "urlImage": urlImagem
    };
  }

}