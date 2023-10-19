import 'package:flutter/material.dart';
import 'package:login/model/tarefas_back4app_model.dart';
import 'package:login/repositories/back4app/tarefas_back4app_repository.dart';

class tarefaHttpPage extends StatefulWidget {
  const tarefaHttpPage({super.key});

  @override
  State<tarefaHttpPage> createState() => _tarefaHttpPageState();
}

class _tarefaHttpPageState extends State<tarefaHttpPage> {

  //controller do campo "salvar"
  var descicaoController = TextEditingController();

  //instanciando as funções get e set
  //chamando no botão de salvar
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();

  //criando o array que vai receber as tarefas já criadas pelo usuario
  //vai ser chamado dentro do initial state, através da função obterTarefas
  //o model pede pelo menos um parametro, mesmo que seja vazio
  var _tarefasBack4App = TarefasBack4AppModel([]);

  //controller da filtragem de não concluidas
  var apenasConcluidas = false;

  var loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  //preenchendo a lista de tarefas (criada acima) com os paramtros do repository
  //vai ser carregado quando for carregada a tela com o initialState
  void obterTarefas() async {
    setState(() {
      loading = true;
    });
    _tarefasBack4App = await tarefaRepository.getTask(apenasConcluidas);
    setState(() {
      loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //esse é aquele botão no canto inferior direito
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () {

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
                  await tarefaRepository.save(TarefaBack4AppModel.criar(descicaoController.text, false));
                  //chamando a função de adicionar (repository) e passando
                  //o campo de texto junto com o false para deixar a caixa desmarcada
                  //await tarefaRepository.adicionar(Tarefa(descicaoController.text, false));
                  Navigator.pop(context);
                  //fazendo com que o builder do ListView seja recarregado, e assim recarregando a lista na tela
                  setState(() { });
                  obterTarefas();

                },
                child: const Text('Salvar'),
              ),

            ],
          );

        });

      },
      ),

      appBar: AppBar(title: const Text("Tarefas Back 4 App"),),

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
                  const Text("Apenas não concluidas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Switch(value: apenasConcluidas, onChanged: (bool value) async {
                    apenasConcluidas = value;
                    setState(() { });
                    obterTarefas();
                  })
                ],
              ),
            ),

            //é preciso usar o expanded, para referenciar o tamanho dentro do collum
            //vai expandir conforme o necessario
            loading ?
            const Center(child: LinearProgressIndicator()) :
            Expanded(
              child: ListView.builder(
                //dizendo quando itens tem na lista, que vai ser justamente o tamanho da lista de tarefas
                  itemCount: _tarefasBack4App.tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    //no .builder, é feito um map/forEach de forma automatica, apenas passando o index
                    var tarefaBack4App = _tarefasBack4App.tarefas[index];

                    //adicionando função de deslizar o "card"
                    return Dismissible(

                      //pegando o id do item selecionado
                      key: Key(tarefaBack4App.objectId),

                      //dimissDirection é ele reconhecendo que foi arrastado (ambas as direções)
                      //e chamando a função de remover passando o id
                      onDismissed: (DismissDirection dismissDirection) async {
                       // await tarefaRepository.remover(tarefa.getId);
                        setState(() { });
                      },

                      child: ListTile(
                        title: Text(tarefaBack4App.tarefa),

                        //usando a função de alterar do repository
                        trailing: Switch(
                          //atribuindo o value como o armazenado no array
                          value: tarefaBack4App.check,
                          onChanged: (bool value) async {
                            //algerando o valor do objeto e atualizando com o setState
                            await tarefaRepository.put(TarefaBack4AppModel.criar(descicaoController.text, apenasConcluidas));
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
