import 'package:aula_913/domain/propriedade.dart';
import 'package:dio/dio.dart';

class PropriedadesApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/tarsisms/fake-api';

  Future<List<Propriedade>> findAll() async {
    // Database db = await DBHelper().initDB();
    // String sql = 'SELECT * FROM PROPRIEDADE;';
    // var result = await db.rawQuery(sql);

    List<Propriedade> listaPropriedades = [];

    final response = await dio.get('$baseUrl/properties');
    print(response);

    // await Future.delayed(Duration(seconds: 5));

    if (response.statusCode == 200) {
      var result = response.data;

      // ForEach
      for (var json in result) {
        Propriedade propriedade = Propriedade.fromJson(json);
        listaPropriedades.add(propriedade);
      }
    }
    return listaPropriedades;
  }
}
