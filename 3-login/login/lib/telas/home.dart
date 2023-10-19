import 'package:flutter/material.dart';
import 'package:login/shared/widgets/custom_drawer.dart';
import 'package:login/telas/ListView/image_assets.dart';
import 'package:login/telas/ListView/list_view_page.dart';
import 'package:login/telas/consultaCep.dart';

import 'ListView/card_page.dart';
import 'ListView/list_view_horizontal.dart';
import 'ListView/tarefa_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<HomeScreen> {

  //variavel que vai receber a posição da pagina com o "onPageChanged" dentro do pageView
  //e que vai controllar a navaigation bar dentro do "current Index",
  //fazendo com que ao trocar a pagina, ele "acenda"
  int pagePosition = 0;

  //variavel que vai receber o valor do botão clicado através do ontap,
  //e que vai vai controllar o PageView pelo "contoller"
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(
            title: const Text('HomePage'),
          ),

          drawer: const customDrawer(),

          body: Column(
            children: [
              
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      pagePosition = value;
                    });
                  },
                  children: const [
                  consultaCep(),
                  CardPage(),
                  imageAssetsPage(),
                  listViewPage(),
                  ListViewHorizontal(),
                  tarefaPage()
                ],
                ),
              ),
              
              BottomNavigationBar(
                //tem de colocar o type, pois apartir de 4 itens, ele quebra
                type: BottomNavigationBarType.fixed,

                  onTap: (value) => controller.jumpToPage(value),
                  currentIndex: pagePosition, 
                  items: const [
                BottomNavigationBarItem(icon: Icon(Icons.get_app_sharp), label: "HTTP"),
                BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
                BottomNavigationBarItem(icon: Icon(Icons.check), label: "ToDo"),
              ])
            ],
          ),
      );

  }
}
