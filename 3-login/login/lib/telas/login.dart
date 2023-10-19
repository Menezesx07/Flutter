import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login/telas/home.dart';
import '../components/login/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<LoginPage> {

  //instanciando o bd
  final _myBox = Hive.box("mybox");

  //chamando as duas variaveis
  getLogin() async {
    var emailLogin = await _myBox.get(1);
    var senhaLogin = await _myBox.get(2);

    print(emailLogin);
    print(senhaLogin);

    //verificação generica
    if(emailLogin == "rafael@henrique" && senhaLogin == "12345678") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
        )
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLogin();
  }


  @override
  Widget build(BuildContext context) {
    //criando os campos de email e senha
    var emailComponent = const inputEmail(
        label: "Email", icone: Icon(Icons.mail_outlined), eyeIcon: false);
    var senhaComponent = const inputEmail(
        label: "Senha", icone: Icon(Icons.lock_outlined), eyeIcon: true);


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          color: Colors.black,

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[

                //margin top
                const SizedBox(
                  height: 50,
                ),

                //logo
                Image.asset('assets/images/logo.png', width: 270),

                //margin top
                const SizedBox(
                  height: 10,
                ),

                //já tem cadastro ?
                const Text("Já tem cadastro ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    )
                ),

                //faça login
                const Text("Faça Login e make the change._",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),

                const SizedBox(
                  height: 75,
                ),

                //email
                emailComponent,

                const SizedBox(
                  height: 10,
                ),

                //senha
                senhaComponent,

                const SizedBox(
                  height: 20,
                ),

                //login
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                          getLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      child: const Text('Login')
                  ),
                ),

                const SizedBox(
                  height: 120,
                ),

                //esqueci minha senha
                Text("Esqueci minha senha",
                  style: TextStyle(color: Colors.amber),),
                Text("Criar conta", style: TextStyle(color: Colors.green),)


              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}