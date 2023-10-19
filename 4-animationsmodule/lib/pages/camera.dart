import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'dart:io';




class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  XFile? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("camera")),

      body: Column(
        children: [

          TextButton(onPressed: () async {

            showModalBottomSheet(context: context, builder: (_) {
              return Wrap(
                  children: [

                  ListTile(leading: const FaIcon(FontAwesomeIcons.camera), title: const Text("Camera"),
                  onTap: () async {
                    //instanciando a função da camera, e chamando ela
                    final ImagePicker _picker = ImagePicker();
                    //o que foi tirando é salvo na variavel "photo"
                    photo = await _picker.pickImage(source: ImageSource.camera);
                    //se a photo existir, é salva no caminho da aplicação com o path_provider
                    if(photo != null) {
                      String path = (await path_provider.getApplicationDocumentsDirectory()).path;
                      //importar o path, não o path_provider, só o path
                      String name = basename(photo!.path);
                      //salvando a foto na pasta do arquivo, concatenando com o nome da mesma
                      await photo!.saveTo("$path/$name");

                      //salvando a imagem na galeria de fotos,
                      //importar o GALLERYsAVER (não image gallery saver)
                      await GallerySaver.saveImage(photo!.path);

                      setState(() { });

                      Navigator.pop(context);
                    }
                  }),

                  const Divider(),

                   ListTile(leading: const FaIcon(FontAwesomeIcons.images), title: const Text("Galeria"),
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    photo  = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() { });

                    Navigator.pop(context);
                  }),

                  ],
              );
            });

            //final ImagePicker _picker = ImagePicker();

            //final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);


          }, child: const Text("Camera")),

          photo != null ?
          Image.file(File(photo!.path)) :
          Container(),

        ],
      ),

    );
  }
}
