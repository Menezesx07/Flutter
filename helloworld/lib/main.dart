import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

// Widget main (app.vue)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(0, 0, 59, 252)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello World !!!'),
    );
  }
}
//Fim Widget main (app.vue)

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//body do app
class _MyHomePageState extends State<MyHomePage> {

  //declaração de variaveis

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //final da declaração de variaveis

  //templante onde são encaixados o widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //widget do app bar
      appBar: AppBar(
        //icone
        leading: const Icon(
          Icons.android_outlined,
          color: Colors.green,
          size: 30.0,
        ),

        //parametros como fundo e titulo
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),

        //botões na direita do app bar
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              _incrementCounter();
            },
            icon: const Icon(Icons.account_circle_outlined),
            color: Colors.white,
          ),
          TextButton(onPressed: () {}, child: const Text('BTN')),
        ],
      ),

      //container do aplicativo
      body: Center(
        child: Column(//collum para FlexBox - flex direction

          mainAxisAlignment: MainAxisAlignment.center, //center: justify content

          children: <Widget>[
            const Text(
              'Você apertou o botão essa quantidade de vezes:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
