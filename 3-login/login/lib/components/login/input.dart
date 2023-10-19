import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class inputEmail extends StatefulWidget {
  const inputEmail({super.key, required this.label, required this.icone, required this.eyeIcon});

  final String label;
  final Icon icone;
  final bool eyeIcon;

  @override
  State<inputEmail> createState() => _inputEmailState();
}



class _inputEmailState extends State<inputEmail> {

 /*pegando a string que vem da label, para direcionar
 a qual key pertence o dado inserido no componente
 visto que ele é generico, caso não fizer isso,
 ele sempre vai sobrescrever a mesma key idependente
 se é login, senha ou cadastro*/
 var identifier;

 void setIdentifier(label){
   setState(() {
     identifier = label;
   });
}


  final _myBox = Hive.box("mybox");

  bool hidePassword = false;

  TextEditingController textController = TextEditingController();

  String? texto;

  //salvando o que foi digitado no campo para o Hive(bd local)
  //que vai ser puxado na tela de login ao clicar no botão
  getTextCont (textController) {
    setState(() {
      if(identifier == "Email") {
        _myBox.put(1, textController);
        print(_myBox.get(1));
      } else {
        _myBox.put(2, textController);
        print(_myBox.get(2));
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    setIdentifier(widget.label);


    //setando se vai aparecer o olho ou outro icone (gambiarra)
    bool eyeIcon1 = widget.eyeIcon;

    return SizedBox(
      width: 400,
      height:50,
      child: TextField(
        controller: textController,
        onChanged: (textController) {
           getTextCont(textController);
           setState(() {
             texto = textController;
           });
           //readData();
        },
        style: const TextStyle(color: Colors.white),

        //deixando visivel a senha, caso não receber o eye (email) não faz nada
        //bug que faz com que
        obscureText: hidePassword,

        decoration: InputDecoration(
          prefixIcon: widget.icone,
          prefixIconColor: Colors.purpleAccent,
          suffixIcon: IconButton(
              onPressed:(){
                setState(() {
                hidePassword = !hidePassword;
                });
              },
              color: Colors.white,
              //setando o icone para exibir o check da senha
              //caso não for um campo de senha (eyeIcon1) ele não aparece icone
              icon: Icon (!eyeIcon1 ? null : hidePassword  ? Icons.visibility_off: Icons.visibility),
          ),

          //removendo a label quando escreve
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 20),

        ),
      ),
    );
  }
}
