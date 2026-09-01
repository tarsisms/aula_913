import 'package:aula_913/domain/Address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final dio = Dio();
  String baseUrl = 'https://viacep.com.br';

  findByCep(String cep) async {
    late Address address;
    final response = await dio.get('$baseUrl/ws/$cep/json/');

    if (response.statusCode == 200) {
      address = Address.fromJson(response.data);
    }

    return address;
  }
}
