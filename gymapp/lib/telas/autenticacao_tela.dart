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
  //key global que vai ser usada para da true ou false na validação
  //chamado no form
  final _formKey = GlobalKey<FormState>();

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
              //key global que vai ser usada para da true ou false na validação
              key: _formKey,
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
                          //validator para as validações dos campos (usado na key em cima e função em baixo)
                          //ele já cria o texto em baixo do campo
                          validator: (String? value) {
                            if(value == null) {
                              return "O e-email não pode ser vazio";
                            }
                            if (value.length < 5) {
                              return "O e-mail é muito curto";
                            }
                            if (!value.contains("@")) {
                              return "O e-email não é valido";
                            }
                            return null;
                          },
                      ),

                      //espaçamento
                      const SizedBox(
                        height: 8,
                      ),

                      TextFormField(
                          decoration: getAuthenticationInputDecoration("Senha"),
                          obscureText: true,
                        validator: (String? value) {
                          if(value == null) {
                            return "A senha não pode ser vazia";
                          }
                          if (value.length < 8) {
                            return "A senha é muito curta";
                          }
                          return null;
                        },
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
                                validator: (String? value) {
                                  if(value == null) {
                                    return "A confirmação de senha não pode ser vazia";
                                  }
                                  if (value.length < 8) {
                                    return "A confirmação de senha é muito curta";
                                  }
                                  return null;
                                },
                                ),//ocultar senha

                              //espaçamento
                              const SizedBox(
                                height: 8,
                              ),

                              TextFormField(
                            decoration: getAuthenticationInputDecoration("Nome"),
                              validator: (String? value) {
                                if(value == null) {
                                  return "O nome não pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                              ),
                            ],
                          ),
                      ),

                      //espaçamento
                      const SizedBox(
                        height: 8,
                      ),


                      ElevatedButton(
                          onPressed: (){
                            botaoPrincipalClicado();
                          },
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

  botaoPrincipalClicado() {

    //para a key ser considerada como true, todos os validator tem de serem validados
    if(_formKey.currentState!.validate()){
      print("Form valido");
    } else {
      print("form Invalido");
    }
  }

}

