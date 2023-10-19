import 'package:animationsmodule/pages/camera.dart';
import 'package:animationsmodule/pages/qr_code_page.dart';
import 'package:animationsmodule/shared/auto_sized_text/auto_sized_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class customDrawer extends StatelessWidget {
  const customDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 20),


          InkWell(
            onTap: () {
              //modal que aparece de baixo para cima (algo parecido com o "compartilhar"
              showModalBottomSheet(context: context, builder: (BuildContext bc) {
                //wrap deixa a modal pequena
                return  Wrap(
                  children: [
                    ListTile(
                      title: const Text("Camera"),
                      leading: const Icon(Icons.camera_alt_outlined),
                      onTap: () => Navigator.pop(context),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("Galeria"),
                      leading: const Icon(Icons.photo_album_outlined),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                );
              });
            },
            child: UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.transparent),
                currentAccountPicture: Image.network("https://play-lh.googleusercontent.com/P3xTS7gQrh0S2e_99KmHVGiVUcvepvj4eFFhqU_y6XFRegRoo1fTZ8r6t1MUsmfRxXNJ"),
                accountName: const Text("Rafael Henrique", style: TextStyle(color: Colors.black),),
                accountEmail: const Text("Rafael@henrique", style: TextStyle(color: Colors.black)),

            ),
          ),

          const SizedBox(height: 10),
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.magnifyingGlass, color: Colors.deepOrange,),
                  SizedBox(width: 10),
                  Text("Opção 1"),
                ],
              ),
            ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AutoSizedPage()));
            },
          ),

          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.firefoxBrowser, color: Colors.deepOrange,),
                  SizedBox(width: 10),
                  Text("Url Launcher"),
                ],
              ),
            ),
            onTap: () async {
              await launchUrl(Uri.parse("http://dio.me"));
            },
          ),

          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.shareFromSquare , color: Colors.deepOrange,),
                  SizedBox(width: 10),
                  Text("Compartilhar"),
                ],
              ),
            ),
            onTap: () async {
              await launchUrl(Uri.parse("http://dio.me"));
            },
          ),

          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.qrcode , color: Colors.deepOrange,),
                  SizedBox(width: 10),
                  Text("QrCode"),
                ],
              ),
            ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QrCodePage()));
            },
          ),

          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.camera, color: Colors.deepOrange,),
                  SizedBox(width: 10),
                  Text("Camera"),
                ],
              ),
            ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
            },
          ),

        ],
      ),
    );
  }
}
