import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/minhas_cores.dart';
import 'package:flutter_gymapp/componentes/decoracao_campo_autenticacao.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {

  bool queroEntrar = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.amarelo,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              MinhasCores.amareloGradienteTop,
              MinhasCores.amareloGradienteDown
            ],
            ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Center(
                //SingleChildScrollView para evitar o erro de sobreposição
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,    //alinhando na vertical
                    crossAxisAlignment: CrossAxisAlignment.stretch, //alinhando na horizontal
                    children: [
                      Image.asset("assets/logo.png",height: 128),
                      const Text("GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      
                      //espaçamento
                      const SizedBox(
                        height: 32,
                      ),


                      //Formulario
                      TextFormField(
                        //getAuthenticationInputDecoration() é um componente criado
                          decoration: getAuthenticationInputDecoration("E-mail"),
                      ),

                      //espaçamento
                      const SizedBox(
                        height: 8,
                      ),

                      TextFormField(
                          decoration: getAuthenticationInputDecoration("Senha"),
                          obscureText: true,
                          ),

                      //espaçamento
                      const SizedBox(
                        height: 8,
                      ),

                      //equivalente ao v-show do Vue
                      Visibility(
                        //usa o boolean como parametro
                          visible: !queroEntrar,
                          child: Column(
                            children: [

                              TextFormField(
                            decoration: getAuthenticationInputDecoration("Confirme a senha"),
                            obscureText: true,
                                ),//ocultar senha

                              //espaçamento
                              const SizedBox(
                                height: 8,
                              ),

                              TextFormField(
                            decoration: getAuthenticationInputDecoration("Nome"),),

                            ],
                          ),
                      ),

                      //espaçamento
                      const SizedBox(
                        height: 8,
                      ),


                      ElevatedButton(
                          onPressed: (){},
                          child: Text((queroEntrar) ? "Entrar" : "Cadastrar")),
                      TextButton(onPressed: (){
                        setState(() {
                          queroEntrar = !queroEntrar;
                        });
                      }, child: Text((queroEntrar) ? "Cadastrar" : "Já tem uma conta ? "))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}

