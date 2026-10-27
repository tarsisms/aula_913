import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // se usar o await -> async e o Future<TipoDeRetorno>
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'airbnb-v2.db';

    // Criar o path (caminho) do db (banco de dados)
    String dbPath = join(path, dbName);

    // Criar ou Obter o Banco de Dados
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);

    return db;
  }

  Future<void> onCreateDB(Database db, int version) async {
    String sql = '''CREATE TABLE PROPRIEDADE ( 
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      total REAL NOT NULL,
      avaliacao REAL,
      dates TEXT,
      local TEXT,
      host TEXT,
      urlImagem TEXT
    ); ''';

    await db.execute(sql);

    sql =
        "INSERT INTO Propriedade (total, avaliacao, dates, local, host, urlImagem) VALUES (2225.000, 4.80, '10-31 Dec', 'Harlingen, Netherlands', 'Professional Host', 'https://news.airbnb.com/wp-content/uploads/sites/4/2019/06/PJM020719Q202_Luxe_WanakaNZ_LivingRoom_0264-LightOn_R1.jpg?fit=3200%2C2133');";
    await db.execute(sql);

    sql =
        "INSERT INTO Propriedade (total, avaliacao, dates, local, host, urlImagem) VALUES (1850.000, 4.92, '20-28 Jul', 'Campos do Jordão, Brazil', 'Superhost', 'https://imgmd.net/images/v1/guia/1702554/o-que-fazer-em-campos-do-jordao.jpg');";
    await db.execute(sql);

    sql =
        "INSERT INTO Propriedade (total, avaliacao, dates, local, host, urlImagem) VALUES (980.000, 4.75, '05-15 Sep', 'Lisbon, Portugal', 'Professional Host', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/82990832.jpg?k=83c1b95f88126bb3f1d822c19654c1ff5e1b037c4d25042dbd82112e25331afb&o=&hp=1');";
    await db.execute(sql);

    sql =
        "INSERT INTO Propriedade (total, avaliacao, dates, local, host, urlImagem) VALUES (3200.000, 4.98, '28 Dec - 05 Jan', 'Florianópolis, Brazil', 'Superhost', 'https://images.squarespace-cdn.com/content/v1/5a87961cbe42d637c54cab93/1590068567445-M7OYHFFDUGIN6ORO1P4V/florianopolis-things-to-do.jpg');";
    await db.execute(sql);

    sql = '''CREATE TABLE USER ( 
      username TEXT PRIMARY KEY,
      password TEXT
    ); ''';

    await db.execute(sql);

    sql = "INSERT INTO USER (username, password) VALUES ('joao@gmail.com', '123456');";
    await db.execute(sql);
  }
}
