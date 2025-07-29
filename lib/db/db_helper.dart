import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'airbnb.db';

    // C:/aqrquivos/jkdahsdja/airbnb.db
    String dbPath = join(path, dbName);
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<void> onCreate(Database db, int version) async {
    String sql = '''CREATE TABLE Propriedade (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    valor REAL NOT NULL,
    avaliacao REAL,
    datas TEXT,
    local TEXT,
    tipoDeHost TEXT,
    urlImage TEXT
    );''';

    await db.execute(sql);

    sql =
        "INSERT INTO Propriedade (valor, avaliacao, datas, local, tipoDeHost, urlImage) VALUES (2225.000, 4.80, '10-31 Dec', 'Harlingen, Netherlands', 'Professional Host', 'https://news.airbnb.com/wp-content/uploads/sites/4/2019/06/PJM020719Q202_Luxe_WanakaNZ_LivingRoom_0264-LightOn_R1.jpg?fit=3200%2C2133');";
    await db.execute(sql);

    sql =
        "INSERT INTO Propriedade (valor, avaliacao, datas, local, tipoDeHost, urlImage) VALUES (1850.000, 4.92, '20-28 Jul', 'Campos do Jordão, Brazil', 'Superhost', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/667104136.jpg?k=0232c39cb40c3b9c7c3b60b2c5c9fa1d0c7c25b4e20e3354ae71df528b0a13a9&o=&hp=1');";
    await db.execute(sql);

    sql =
        "INSERT INTO Propriedade (valor, avaliacao, datas, local, tipoDeHost, urlImage) VALUES (980.000, 4.75, '05-15 Sep', 'Lisbon, Portugal', 'Professional Host', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/82990832.jpg?k=83c1b95f88126bb3f1d822c19654c1ff5e1b037c4d25042dbd82112e25331afb&o=&hp=1');";
    await db.execute(sql);

    sql =
        "INSERT INTO Propriedade (valor, avaliacao, datas, local, tipoDeHost, urlImage) VALUES (3200.000, 4.98, '28 Dec - 05 Jan', 'Florianópolis, Brazil', 'Superhost', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/173625874.jpg?k=5d9a7d0bcdb33c8c6959ac1d03cd869a7a34cbc1e16485486e518fb846fb664a&o=&hp=1');";
    await db.execute(sql);
  }
}
