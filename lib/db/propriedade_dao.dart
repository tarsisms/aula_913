/*Função desta tela: Retorna a lista completa de propriedades, que a ExplorePage vai usar para montar a ListView. Cada propriedade é um objeto, com suas informações específicas (cada local do airbnb)*/

import 'package:aula_913/domain/Propriedade.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class PropriedadeDao {
  Future<List<Propriedade>> listarPropriedades() async {
    Database db = await DBHelper().initDB();

    var result = await db.rawQuery('SELECT * FROM PROPRIEDADE');

    // linha p/ linha
    List<Propriedade> lista = [];
    for (var json in result) {
      // Metodo Padrão
      // Propriedade propriedade = Propriedade(
      //   urlImagem: json['urlImagem'],
      //   dates: json['dates'],
      //   local: '',
      //   host: '',
      //   total: '',
      // );

      Propriedade propriedade = Propriedade.fromJson(json);
      lista.add(propriedade);
    }

    await Future.delayed(Duration(seconds: 5));
    return lista;
  }
}
