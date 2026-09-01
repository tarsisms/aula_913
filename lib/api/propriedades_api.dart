import 'package:aula_913/domain/Propriedade.dart';
import 'package:dio/dio.dart';

class PropriedadesApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/tarsisms/fake_api';

  Future<List<Propriedade>> listarPropriedades() async {
    final response = await dio.get('$baseUrl/propriedades');

    List<Propriedade> lista = [];

    if (response.statusCode == 200) {
      for (var json in response.data) {
        Propriedade propriedade = Propriedade.fromJson(json);
        lista.add(propriedade);
      }
    }

    return lista;
  }
}
