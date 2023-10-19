import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/model/tarefa.dart';
import 'package:login/repositories/tarefa_repository.dart';

class tarefaPage extends StatefulWidget {
  const tarefaPage({super.key});

  @override
  State<tarefaPage> createState() => _tarefaPageState();
}

class _tarefaPageState extends State<tarefaPage> {

  //controller do campo "salvar"
  var descicaoController = TextEditingController();

  //instanciando as funções get e set
  //chamando no botão de salvar
  var tarefaRepository = TarefaRepository();

  //criando o array que vai receber as tarefas já criadas pelo usuario
  //vai ser chamado dentro do initial state, através da função obterTarefas
  var _tarefas = <Tarefa> [];

  //controller da filtragem de não concluidas
  var apenasConcluidas = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  //preenchendo a lista de tarefas (criada acima) com os paramtros do repository
  //vai ser carregado quando for carregada a tela com o initialState
  void obterTarefas() async {

    //se o switch do filtro estiver marcado, retorna as não concuidas, se não, retorna tudo
    if(apenasConcluidas) {
      _tarefas = await tarefaRepository.listarTarefasNaoConcluidas();
    } else {
      _tarefas = await tarefaRepository.listarTarefas();
    }

    setState(() { });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //esse é aquele botão no canto inferior direito
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {

        //limpando a variavel de texto ao CARREGAR o componente
        //caso não, ao clicar em cancelar ou salvar, ele pega o digitado anteriormente
        descicaoController.text = "";

        showDialog(context: context, builder: (BuildContext bc) {

          return AlertDialog(
            title: const Text("Adicionar Tarefa"),
            content: TextField(
              //adicionando o controllador
              controller: descicaoController,
            ),
            actions: [

              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
              FilledButton(
                //é usada o async, pois o setState (recarregar lista) roda muito rapido
                //e não da tempo de da o reload com o novo dado inserido
                //justamente por conta do "Delayed" de 1 segundo
                onPressed: () async {
                    //chamando a função de adicionar (repository) e passando
                    //o campo de texto junto com o false para deixar a caixa desmarcada
                   await tarefaRepository.adicionar(Tarefa(descicaoController.text, false));
                   Navigator.pop(context);
                    //fazendo com que o builder do ListView seja recarregado, e assim recarregando a lista na tela
                    setState(() { });
                    obterTarefas();
                     print("inicio");
                     print(_tarefas.length);
                     print("inicio");

                },
                child: const Text('Salvar'),
              ),

            ],
          );

        });

        },
      ),
      //para gerar os dados baseado numa lista(ou array) é preciso usar o .builder
      //justamente para quando for atualizada, ser rebuildada, como acontece no Widget Build
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Apenas não concluidas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Switch(value: apenasConcluidas, onChanged: (bool value) {
                    apenasConcluidas = value;
                    setState(() { });
                    obterTarefas();
                  })
                ],
              ),
            ),

            //é preciso usar o expanded, para referenciar o tamanho dentro do collum
            //vai expandir conforme o necessario
            Expanded(
              child: ListView.builder(
                  //dizendo quando itens tem na lista, que vai ser justamente o tamanho da lista de tarefas
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                  //no .builder, é feito um map/forEach de forma automatica, apenas passando o index
                  var tarefa = _tarefas[index];

                  //adicionando função de deslizar o "card"
                  return Dismissible(

                    //pegando o id do item selecionado
                    key: Key(tarefa.getId),

                    //dimissDirection é ele reconhecendo que foi arrastado (ambas as direções)
                    //e chamando a função de remover passando o id
                    onDismissed: (DismissDirection dismissDirection) async {
                      await tarefaRepository.remover(tarefa.getId);
                      setState(() { });
                    },

                    child: ListTile(
                        title: Text(tarefa.getDescricao),

                        //usando a função de alterar do repository
                        trailing: Switch(
                          //atribuindo o value como o armazenado no array
                          value: tarefa.getConcluido,
                          onChanged: (bool value) async {
                            //algerando o valor do objeto e atualizando com o setState
                            await tarefaRepository.alterar(tarefa.getId, value);
                            setState(() { });

                          },
                        ),
                    ),
                  );

              }),
            ),
          ],
        ),
      ),
    );
  }
}
