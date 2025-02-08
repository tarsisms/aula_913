import 'package:aula_913/bd/db_helper.dart';
import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  salvarPacote(PacoteTuristico pacote) async {
    Database database = await DBHelper().initDB();
    database.insert('PACOTE', pacote.toJson());
  }

  Future<List<PacoteTuristico>> listarPacotes() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM PACOTE;';
    var result = await database.rawQuery(sql);

    List<PacoteTuristico> lista = [];
    for (var json in result) {
      PacoteTuristico pacote = PacoteTuristico.fromJson(json);
      lista.add(pacote);
    }

    return lista;
  }
}
