import '../model/tarefa.dart';

//essa classe é a base da tarefa_page, onde daqui vão ser baseados os "ToDos"
class TarefaRepository {

  //Tarefa recebe os parametros de ID, descrição e concluido do model

  //simulando o banco de dados
  final List<Tarefa> _tarefas = [];


  //adicionando a tarefa com a descrição e o bool como falso (automatico)
  //id é gerado automagicamente
  //é usado o future, pois essa função vai ser chamada com await
  Future <void> adicionar(Tarefa tarefa) async{
    await Future.delayed(const Duration(milliseconds: 200));
    _tarefas.add(tarefa);
  }

  //alerar o status de concluido ou não, no caso
  //só é passado o id, já o boolean, é feito uma verificação com if/else
  //e enviado o comando certo
  Future <void> alterar(String id, bool concluido) async {

    await Future.delayed(const Duration(milliseconds: 100));
    //acessando o array (bd) _tarefas, e chamando a condição
    _tarefas.where((element) => element.getId == id).first.setConcluido(concluido);

  }

  //retornando todas as tarefas (chamado ao abrir a tela ou alguma alteração
  Future <List<Tarefa>> listarTarefas() async{
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas;
  }

  //retornando todas as tarefas (chamado ao abrir a tela ou alguma alteração
  Future <List<Tarefa>> listarTarefasNaoConcluidas() async{
    await Future.delayed(const Duration(milliseconds: 100));
    //passando o item selecionado como parametro, e vendo se ele foi "concluido"
    //se sim, passa direto, caso não, é retornado
    return _tarefas.where((tarefa) => !tarefa.getConcluido).toList();
  }

  //removendo o item
  Future <void> remover(String id) async {

    await Future.delayed(const Duration(milliseconds: 100));

    //procurando o item na lista (igual no alterar do witch) porém invocando na fução de remover
    _tarefas.remove(_tarefas.where((element) => element.getId == id).first);


  }

}