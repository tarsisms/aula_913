import 'package:aula_913/domain/Address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final dio = Dio();
  String baseUrl = 'https://brasilapi.com.br/api';

  Future<Address> findByCep(String cep) async {
    final response = await dio.get('$baseUrl/cep/v2/$cep');

    Address address = Address.fromJson(response.data);
    return address;
  }
}
