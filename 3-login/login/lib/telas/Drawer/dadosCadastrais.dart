import 'package:flutter/material.dart';
import 'package:login/repositories/hive_repository.dart';
import 'package:login/shared/widgets/text_label.dart';
import '../../repositories/linguagens_repository.dart';

class dadosCadastrais extends StatefulWidget {
  const dadosCadastrais({super.key, required this.label});

  final String label;

  @override
  State<dadosCadastrais> createState() => _dadosCadastraisState();
}

class _dadosCadastraisState extends State<dadosCadastrais> {
  var nomeController = TextEditingController(text: "");
  var dataNascController = TextEditingController(text: "");
  //usada na validação, caso continuar nula, é dado erro
  DateTime? dataNascimento;

  //instanciando a classe com os niveis
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  //criando o array
  var niveis = [];
  var linguagens = [];
  //salvando os inputs da checkbox (o do radious com só é um, não precisa disso)
  var linguagensSelecionadas = [];
  //recebendo o nivel selecinado no scaffold
  var nivelSelecionado;
  //variavel do salario, que seta o "Value"
  double salarioEscolhido = 1000;
  //dropdown
  int? tempoExperiencia;
  //icone de salvamento
  //é chamado no com o ListView num if ternario
  bool salvando = false;

  //preenchendo o array (não precisa chamar no build)
  //checkar anotação no collum
  @override
  void initState() {
    // TODO: implement initState
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  //loop para criar os itens do dropdown (de 1 até 20)
  //sendo o valor maximo passado como parametro
List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];

    for (var i = 0; i< quantidadeMaxima; i++) {
      itens.add(
        DropdownMenuItem(value: i, child: Text(i.toString())),
      );
    }

    return itens;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.label),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando ? Center(child: CircularProgressIndicator()) : ListView(
            children: [

              const textLabel(texto: "Nome:"),
              TextField(
                controller: nomeController,
              ),

              const textLabel(texto: "Data de Nacimento:"),
              TextField(
                controller: dataNascController,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000,1,1), firstDate: DateTime(1900,5,20), lastDate: DateTime(2023,12,12));

                  //só vai ser chamado se a data for selecionada
                  if(data != null) {
                    dataNascController.text = data.toString();
                    dataNascimento = data;
                  }
                },
              ),

              const textLabel(texto: "Nivel de Experiência:"),
              //precisa fazer o map no nivel, pois é lá onde todos os "niveis"
              //estão salvos, também é preciso deixar dentro do collum para gerar os itens
              //lembrando que tem de setar os valores como "item", pois ele são os objetos
              //criados a partir do "niveis"
              Column(
                children:
                niveis.map((item) => RadioListTile(
                  //dense é para deixar menor
                  dense: true,
                    //controlador de seleção, se o selecionado for igual a algum dos itens
                    //ele é acionado, sendo chamado no "groupValue"
                    selected: nivelSelecionado == item,
                    title: Text(item.toString()),
                    value: item.toString(),
                    groupValue: nivelSelecionado,
                    onChanged: (value) {
                      setState(() {
                        nivelSelecionado = value;
                      });
                    }))
                    .toList()
              ),

              const textLabel(texto: "Linguagens Preferidas: "),
              Column(
                children:
                linguagens.map((item) => CheckboxListTile(
                    //dense é para deixar menor
                    dense: true,
                    title: Text(item),
                    //caso tal item estiver no array, ele sera exibido
                    value: linguagensSelecionadas.contains((item)),
                    //se esse item não estiver no array (caso esteja desmarcado), ele vai ser inserido
                    //mas caso ele já esteja lá (se estiver marcado) ele sera removido
                    onChanged: (value) {
                      setState(() {
                          if(value!) {
                            linguagensSelecionadas.add(item);
                          } else linguagensSelecionadas.remove(item);
                          print(linguagensSelecionadas);

                      });
                    }
              )) .toList()

              ),

              const textLabel(texto: "Tempo de Experiência: "),
              DropdownButton(
                //valor selecionado
                value: tempoExperiencia,
                isExpanded: true, //fazendo o campo ocupar toda a lateral da pagina
                  items: returnItens(21),
                  onChanged: (value) {
                  setState(() {
                    //convertendo de double para int
                    tempoExperiencia = int.parse(value.toString());
                  });
              }),

              textLabel(texto: "Pretenção Salarial - R\$: ${salarioEscolhido.round()},00"),
              Slider(
                  min: 1000,
                  max: 10000,
                  value: salarioEscolhido,
                  onChanged: (double value) {
                  setState(() {
                    salarioEscolhido = value;
                  });
              }),



              //Validações
              TextButton(onPressed: (){

                //limpando a variavel
                setState(() {
                  salvando = false;
                });

                //mesmo retirando os espaços(trim) o numero de
                //caracteres for menor que 4, é exibido um pop-up
                if(nomeController.text.trim().length < 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("O nome deve ser preenchido"))
                  );
                  //para interromper o salvamento das informações em caso de erro
                  return;
                }

                //se a variavel dataNascimento ficar nula, é dado o erro
                //ela nasce nula com o ? na declaração, que ao ser selecinada a data,
                // é preenchida a variaviavel
                if(dataNascimento == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data de Nascimento Invalida"))
                  );
                  //para interromper o salvamento das informações em caso de erro
                  return;
                }

                if(nivelSelecionado == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Selecione a experiência"))
                  );
                }

                if(linguagensSelecionadas.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Deve ser Selecionado pelo menos uma linguagem"))
                  );
                  return;
                }

                if(tempoExperiencia == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Deve ter ao menos 1 ano de experiência"))
                  );
                  return;
                }

                //se tudo der certo, chama o icone de loading
               setState(() {
                 salvando = true;
               });

                //timeOut do Flutter
                Future.delayed(const Duration(seconds: 3), () {

                  const SnackBar(content: Text("Dados Salvos com Sucesso"));

                  setState(() {
                    salvando = false;
                  });

                  Navigator.pop(context);
                });


              }, child: const Text("Salvar")),
            ],

        ),
      ),
    );
  }
}
