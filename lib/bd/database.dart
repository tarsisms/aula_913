import 'package:aula_913/domain/pacote_turistico.dart';

class Database {
  static List pacotes = [
    PacoteTuristico(
      urlImage:
          'https://www.viagenscinematograficas.com.br/wp-content/uploads/2019/03/Cancun-Melhores-Praias-Riviera-Maya-Capa.jpg',
      titulo: 'Pacote Cancún 2024',
      cidade: 'CANCÚN, MEX',
      desconto: 45,
      descricao: 'Aéreo + Hotel All inclusive',
      numDiarias: 5,
      numPessoas: 1,
      valorAntigo: 6818,
      valorAtual: 3749,
    ),
    PacoteTuristico(
      urlImage:
          'https://vidasemparedes.com.br/wp-content/uploads/2024/02/praiasmaragogi-vidasemparedes-14.jpg',
      titulo: 'Pacote Maragogi 2025',
      cidade: 'MARAGOGI, BRA',
      desconto: 15,
      descricao: 'Hotel All inclusive',
      numDiarias: 7,
      numPessoas: 5,
      valorAntigo: 3500,
      valorAtual: 1670,
    ),
    PacoteTuristico(
      urlImage:
      'https://turismo.b-cdn.net/wp-content/uploads/2013/01/Fortaleza-a-capital-do-Ceara.webp',
      titulo: 'Pacote Fortaleza 2025',
      cidade: 'FORTALEZA, BRA',
      descricao: 'Hotel All inclusive',
      numDiarias: 7,
      numPessoas: 3,
      valorAntigo: 2500,
      valorAtual: 1100,
      desconto: 10,
    ),
  ];
}
