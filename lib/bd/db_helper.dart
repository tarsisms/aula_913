import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacote.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  FutureOr<void> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE PACOTE (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo varchar(100), titulo_ano varchar(100), url_image varchar(100), cidade varchar(100), descricao varchar(100), validade varchar(100), desconto INTEGER, num_diarias INTEGER, num_pessoas INTEGER, valor_antigo double, valor_atual double);';
    await db.execute(sql);

    sql =
        "INSERT INTO PACOTE (id, titulo, titulo_ano, url_image, cidade, descricao, validade, desconto, num_diarias, num_pessoas, valor_antigo, valor_atual) VALUES (1, 'Pacote Amsterdam', 'Pacote Amsterdam 2025', 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-amsterda-capa2019-03.jpg', 'AMSTERDAM, NLD', 'Aéreo + Hospedagem', '01 Jan 2025 a 31 Dez 2025', -20, 8, 2, 5486, 3389);";
    await db.execute(sql);

    sql =
        "INSERT INTO PACOTE (id, titulo, titulo_ano, url_image, cidade, descricao, validade, desconto, num_diarias, num_pessoas, valor_antigo, valor_atual) VALUES (2, 'Pacote Cancún', 'Pacote Cancún 2024/2025','https://blogmaladeviagem.com.br/wp-content/uploads/2016/11/Blog-Mala-de-Viagem-cancun.jpg', 'CANCÚN, MEX', 'Aéreo + Transfer Grátis', '01 Nov 2024 a 31 Jul 2025', -40, 5, 2, 6500, 3854);";
    await db.execute(sql);

    sql =
        "INSERT INTO PACOTE (id, titulo, titulo_ano, url_image, cidade, descricao, validade, desconto, num_diarias, num_pessoas, valor_antigo, valor_atual) VALUES (3, 'Pacote Fortaleza', 'Pacote Fortaleza 2025', 'https://turismo.b-cdn.net/wp-content/uploads/2013/01/Fortaleza-a-capital-do-Ceara.webp', 'FORTALEZA, BRA', 'Aéreo + Hotel', '01 Jun 2025 a 31 Dez 2025', -22, 5, 2, 3500, 2850);";
    await db.execute(sql);

    sql =
        "INSERT INTO PACOTE (id, titulo, titulo_ano, url_image, cidade, descricao, validade, desconto, num_diarias, num_pessoas, valor_antigo, valor_atual) VALUES (4, 'Pacote Maragogi', 'Pacote Maragogi 2025', 'https://vidasemparedes.com.br/wp-content/uploads/2024/02/praiasmaragogi-vidasemparedes-14.jpg', 'MARAGOGI, BRA', 'Aéreo + Hotel All inclusive', '01 Fev 2025 a 31 Dez 2025', -10, 10, 2, 4500, 3610);";
    await db.execute(sql);

    sql = "CREATE TABLE USER (username varchar(100) PRIMARY KEY, password varchar(100))";
    await db.execute(sql);

    sql = "INSERT INTO USER (username, password) VALUES ('joao@gmail.com', '123456')";
    await db.execute(sql);
  }
}
