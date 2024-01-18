import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE cars(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        carImmatriculation TEXT,
        carModele TEXT,
        carType TEXT,
        carNumero TEXT,
        carCouleur TEXT,
        carDate TEXT,
        carPneu TEXT,
        carProprio TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'articars.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createCar(
      String carImmatriculation,
      String? carModele,
      String? carType,
      String? carNumero,
      String? carCouleur,
      String? carDate,
      String? carPneu,
      String? carProprio) async {
    final db = await SQLHelper.db();

    final data = {
      'carImmatriculation': carImmatriculation,
      'carModele': carModele,
      'carType': carType,
      'carNumero': carNumero,
      'carCouleur': carCouleur,
      'carDate': carDate,
      'carPneu': carPneu,
      'carProprio': carProprio,
      'createdAt': DateTime.now().toString()
    };
    final id = await db.insert('cars', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all
  static Future<List<Map<String, dynamic>>> getCars() async {
    final db = await SQLHelper.db();
    return db.query('cars', orderBy: "id");
  }

  // Read a single item by id
  static Future<List<Map<String, dynamic>>> getCar(int id) async {
    final db = await SQLHelper.db();
    return db.query('cars', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateCar(
      int id,
      String carImmatriculation,
      String? carModele,
      String? carType,
      String? carNumero,
      String? carCouleur,
      String? carDate,
      String? carPneu,
      String? carProprio) async {
    final db = await SQLHelper.db();

    final data = {
      'carImmatriculation': carImmatriculation,
      'carModele': carModele,
      'carType': carType,
      'carNumero': carNumero,
      'carCouleur': carCouleur,
      'carDate': carDate,
      'carPneu': carPneu,
      'carProprio': carProprio,
      'updatedAt': DateTime.now().toString()
    };

    final result =
        await db.update('cars', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteCar(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("cars", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Quelque chose s'est mal passé: $err");
    }
  }
}
