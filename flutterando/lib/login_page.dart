import 'package:flutter/material.dart';
import 'package:flutterando/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [

              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset("assets/background.jpg", fit: BoxFit.cover,),
              ),

               Form(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset("assets/google.png", height:64),

                          const SizedBox(
                            height: 24,
                          ),

                          Image.network("https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png", height: 32,),

                          const SizedBox(
                            height: 16,
                          ),


                          const SizedBox(
                            height: 16,
                          ),

                          TextFormField(
                            onChanged: (text) {
                              email = text;
                            },
                            decoration: const InputDecoration (
                              hintText: ("Email"),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            ),
                          ),

                          const SizedBox(
                            height: 16,
                          ),

                          TextFormField(
                            onChanged: (text) {
                              senha = text;
                            },
                            decoration: const InputDecoration (
                                hintText: ("Senha"),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8)
                            ),
                          ),

                          const SizedBox(
                            height: 16,
                          ),

                          Container(
                            width: double.infinity,
                            child: ElevatedButton(onPressed: () {
                              if (email == "rafael" && senha == "12345") {
                                // Within the `FirstRoute` widget

                                //só o push ele sobrepoem a tela e coloca a seta
                                // pra voltar, com o replacement para chamar
                                // diretamente e rota a tela antiga some
                                //para rotas pre definidas (main.dart) se usa o Named
                                //porém usando o ReplacementNamed ele fecha a janela antiga
                                Navigator.pushReplacementNamed(context, '/home');


                              } else {
                                print("login errado");
                              }
                            }, child:
                            Text("Entrar")),
                          ),


                        ],
                      ),
                    ),
                  ),
              )




            ],
          )
    );
  }
}
