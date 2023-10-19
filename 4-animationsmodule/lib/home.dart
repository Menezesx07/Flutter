import 'package:animationsmodule/shared/custom_drawer.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(

        appBar: AppBar(
          title: const Text('HomePage'),
        ),

        drawer: const customDrawer(),

        body: TabBarView(
          controller: tabController,
          children: [
          Container(color: Colors.blueAccent),
          Container(color: Colors.deepPurpleAccent),
          Container(color: Colors.red),
          Container(color: Colors.orangeAccent),
          Container(color: Colors.lightGreen),
        ],),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.lightGreen,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      )
    );
    }
  }