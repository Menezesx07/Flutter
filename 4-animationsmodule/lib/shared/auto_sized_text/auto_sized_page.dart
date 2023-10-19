import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizedPage extends StatefulWidget {
  const AutoSizedPage({super.key});

  @override
  State<AutoSizedPage> createState() => _AutoSizedPageState();
}

class _AutoSizedPageState extends State<AutoSizedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AutoSized")),

      body: Container(
        margin: const EdgeInsets.all(8),
        child: const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: AutoSizeText(
                '  Desta maneira, a estrutura atual da organização auxilia a preparação e a composição do levantamento das variáveis envolvidas. É claro que o consenso sobre a necessidade de qualificação nos obriga à análise das novas proposições. A prática cotidiana prova que o comprometimento entre as equipes não pode mais se dissociar do investimento em reciclagem técnica. Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a mobilidade dos capitais internacionais desafia a capacidade de equalização de alternativas às soluções ortodoxas. As experiências acumuladas demonstram que a consolidação das estruturas exige a precisão e a definição do sistema de formação de quadros que corresponde às necessidades.',
                style: TextStyle(fontSize: 20),
                maxLines: 4,
                ),
              )
      ),
      )
    );
  }
}
