class TarefasBack4AppModel {
  List<TarefaBack4AppModel> tarefas = [];

  TarefasBack4AppModel(this.tarefas);

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <TarefaBack4AppModel>[];
      json['results'].forEach((v) {
        tarefas.add(TarefaBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tarefas.map((v) => v.toJson()).toList();

    return data;
  }
}

class TarefaBack4AppModel{
  String objectId = "";
  String tarefa = "";
  bool check = false;
  String createdAt = "";
  String updatedAt = "";

  TarefaBack4AppModel(this.objectId, this.tarefa, this.check, this.createdAt, this.updatedAt);

  TarefaBack4AppModel.criar(this.tarefa, this.check);

  TarefaBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    tarefa = json['tarefa'];
    check = json['check'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['tarefa'] = tarefa;
    data['check'] = check;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndPoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tarefa'] = tarefa;
    data['check'] = check;
    return data;
  }
}