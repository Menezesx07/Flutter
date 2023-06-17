import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

//**********************************************************************
//teve de ser inserido o comando abaixo para o app carregar a img da net
//<uses-permission android:name="android.permission.INTERNET"/>
//app->src->main->AndroidManifest->classe raiz
//**********************************************************************

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  final foto = const CircleAvatar(
    backgroundImage: NetworkImage("https://picsum.photos/id/237/200/200"),
    radius: 100,

  );
  final nome = const Text(
      "Rafael Henrique",
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );

  final btnPhone = IconButton(
    icon: const Icon(Icons.phone),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(scheme: "tel", path: "9999-9999"));
    },
  );
  final btnEmail = IconButton(
    icon: const Icon(Icons.mail),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(scheme: "mailTo", path: "exemple@mail.com"));
    },
  );
  final btnMessage = IconButton(
    icon: const Icon(Icons.sms),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(scheme: "sms", path: "9999-9999"));
    },
  );


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('He is Rafael')));
            },
          ),

          //botão que leva a proxima pagina
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: foto,
            ),
          nome,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btnPhone,
              btnEmail,
              btnMessage
            ],
          ),
        ],
      ),


    );
  }


}
