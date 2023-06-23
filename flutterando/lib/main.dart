import 'package:flutter/material.dart';
import 'package:flutterando/app_controller.dart';
import 'package:flutterando/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: AppController.instance.isDarkTheme ? Brightness.dark : Brightness.light,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,

          ),
          initialRoute: '/',
          //home: const MyHomePage(title: 'Flutter Demo Home Page'),
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => MyHomePage(title: "logado")
          },
        );
      },
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

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
           
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      "https://wallpapers.com/images/hd/cute-girl-vector-art-profile-picture-jhbu3wt713zj2bti.jpg"),
                ),
                accountName: Text("Rafael"), 
                accountEmail: Text("Rafael@teste")),
            ListTile(
              title: const Text('Item 1'),
              subtitle: const Text("subtitle"),
              leading: Icon(Icons.account_box_outlined),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),


      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          CustomSwitcher(),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {

              //navegattion.pop para voltar a tela anterior, mas se usar
              //o ReplacementNamed ele fecha o app pois ele fechou a primeira tela
              //sendo assim precisia passar a rota novamente
              Navigator.pushReplacementNamed(context, "/");

            },
          ),

        ],
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSwitcher(),
            Text("Contador: $_counter"),

            //espaçamento
            const SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
              ],
            ),
          ],
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),


    );
  }
}


class CustomSwitcher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Switch(
    value: AppController.instance.isDarkTheme,
    onChanged: (value){
    AppController.instance.changeTheme();
    });
  }
}


