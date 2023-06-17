import 'package:flutter/material.dart';
import 'package:dart_eval/dart_eval.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String display = "0";
  String operation = "";
  double firstNum = 0.0;

  //setState para alterar a variavel no display
  //num += tecla, pega o numero já salvo e concatena com o novo
  //porem, só vai concatenar se for um numero digitado(ex: 1+2 = 12)

  void calcular(String tecla) {
    switch (tecla) {
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
      case "0":
      case ".":
        setState(() {
          display += tecla;

          if (display.contains(".")) {
            //double numDouble = double.parse(display);
            // display = numDouble.toString();
          } else {
            int numInt = int.parse(display);
            display = numInt.toString();
          }
        });

        break;

      case "+":
      case "-":
      case "*":
      case "/":
        operation = tecla;
        firstNum = double.parse(display);
        display = "0";
        break;

      case "=":

        if (operation == "/" && double.parse(display) * 1 == 0 ) {
          print("erro: divisão por 0");
          return;
        }

        //bom e velho eval salvando de fazer gambiarra com if e else
        String res = (eval("$firstNum $operation $display")).toString();

        //dividindo o double (que virou string) em duas partes, separados pelo .
        //ex : 10.2 ele vai separa e virar 10 e 2, em forma de array [10, 2]
        //podendo ser acessado como resArray[i] sendo i a posição
        List<String> resArray = res.split(".");

        //fazendo a validação pra ver se tem um zero solto apos a virgula
        //resultante da conversão do double (ex: 10.0) o 0 pos virgula é removido
        //porém se for 10.02, fica normal
        //validação é feita multiplicando o numero pos virgula * 1, se for 0
        //ele faz o if else
        if (int.parse(resArray[1]) * 1 == 0) {
        int.parse(resArray[0]);

          setState(() {
            display = int.parse(resArray[0]).toString();
          });
        } else {

          setState(() {
            display = res.toString();
          });
        }

        break;

      case "AC":
        setState(() {
          display = "0";
          firstNum = 0.0;
          operation = "";
        });
        break;

      case "del":
        setState(() {
        if(display.length > 0) {
          display = display.substring(0, display.length-1);
        } 
        });



        break;

      default:
        print("default");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(display, style: TextStyle(fontSize: 72)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
                onTap: () {
                  calcular("AC");
                },
                child: Text(
                  "AC",
                  style: TextStyle(fontSize: 36),
                )),
            Text(""),
            Text(""),
            GestureDetector(
                onTap: () => calcular("del"),
                child: Text("del", style: TextStyle(fontSize: 36))),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
                onTap: () => calcular("7"),
                child: Text("7", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("8"),
                child: Text("8", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("9"),
                child: Text("9", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("/"),
                child: Text("/", style: TextStyle(fontSize: 36))),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
                onTap: () => calcular("4"),
                child: Text("4", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("5"),
                child: Text("5", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("6"),
                child: Text("6", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("*"),
                child: Text("x", style: TextStyle(fontSize: 36))),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
                onTap: () => calcular("1"),
                child: Text("1", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("2"),
                child: Text("2", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("3"),
                child: Text("3", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("-"),
                child: Text("-", style: TextStyle(fontSize: 36))),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
                onTap: () => calcular("0"),
                child: Text("0", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("."),
                child: Text(".", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("="),
                child: Text("=", style: TextStyle(fontSize: 36))),
            GestureDetector(
                onTap: () => calcular("+"),
                child: Text("+", style: TextStyle(fontSize: 36))),
          ]),
        ],
      ),
    );
  }
}
