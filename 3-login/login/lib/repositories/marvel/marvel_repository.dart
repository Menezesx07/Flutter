import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../model/character_model.dart';
import 'package:crypto/crypto.dart' as crypto;

class MarvelRepository {

  Future<CharactersModel> getCharacters() async {
    var dio = Dio();
    //preenchendo a url com esses dados abaixo
    //hora atual exata
    var ts = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    //chave publica no dot.env, lembrando que tem de criar um .env com as chaves e
    //instalar a dependencia "dovEnv" no .yaml
    var publicKey = dotenv.get("MARVELPUBLICKEY");
    var privateKey = dotenv.get("MARVELPRIVATEKEY");
    //hash vai ser uma chave criptografada da combinação das 3 chaves abaixo
    var hash = _generateMd5(ts + privateKey + publicKey);
    //query vai concatenar o a url base
    var query = "ts=$ts&apikey=$publicKey$hash=$hash";
    //fazendo a chamada na api da marvel
    var res = await dio.get("https://gateway.marvel.com/v1/public/characters?$query");

    var charactersModel = CharactersModel.fromJson(res.data);

    return charactersModel;
  }

    //o site da marvel precisa de uma criptografia md5, nesse caso, estamos fazendo a mesma
    _generateMd5(String data) {
      var content = const Utf8Encoder().convert(data);
      var md5 = crypto.md5;
      var digest = md5.convert(content);
      return hex.encode(digest.bytes);
    }



  }

