import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login/telas/home.dart';
import 'telas/login.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  //escolhendo a pasta onde vai ficar o BD do Hive
  var documentsDirectory = await path_provider.getApplicationDocumentsDirectory();

  //obs hive : dentro do componente importar o hive.dart
  //sempre que adicionar o hive, tem de reiniciar o projeto

  //inicializando o hive, com o caminho criado
  await Hive.initFlutter(documentsDirectory.path);

  //abrindo a caixa(iniciando o db)
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

