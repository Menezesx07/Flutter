import 'package:flutter/material.dart';
import 'package:calculadora/btn/btn.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("Calculadora")),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("123", style: TextStyle(fontSize: 72)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomBtn(value: "AC"),
            Text(""),
            Text(""),
            CustomBtn(value: "del"),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomBtn(value: "7"),
            CustomBtn(value: "8"),
            CustomBtn(value: "9"),
            CustomBtn(value: "/"),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomBtn(value: "4"),
            CustomBtn(value: "5"),
            CustomBtn(value: "6"),
            CustomBtn(value: "*"),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomBtn(value: "1"),
            CustomBtn(value: "2"),
            CustomBtn(value: "3"),
            CustomBtn(value: "-"),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomBtn(value: "0"),
            CustomBtn(value: "."),
            CustomBtn(value: "="),
            CustomBtn(value: "+"),

          ]),
        ],
      ),
    );
  }
}




