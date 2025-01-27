import 'package:aula_913/domain/address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final String domain = 'https://brasilapi.com.br';
  final dio = Dio();

  Future<Address> findAddressByCep(String cep) async {
    final response = await dio.get('$domain/api/cep/v2/$cep');
    Address address = Address.fromJson(response.data);

    print(response);
    return address;
  }
}
