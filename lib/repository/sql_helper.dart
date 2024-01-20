import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createCarTable(sql.Database database) async {
    await database.execute("""
      CREATE TABLE cars(
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
        updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    """);
  }

  static Future<void> createSuivieTable(sql.Database database) async {
    await database.execute("""CREATE TABLE suivies(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        typeSuivie TEXT,
        car TEXT,
        date TEXT,
        assurance TEXT,
        police_number TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<void> createUserTable(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        userFirstName TEXT,
        userLastName TEXT,
        userAddress TEXT,
        userLocation TEXT,
        userResponsible TEXT,
        userPhone TEXT,
        userSociety TEXT,
        userFax TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<void> createGarageTable(sql.Database database) async {
    await database.execute("""CREATE TABLE garages(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        Address TEXT,
        location TEXT,
        responsible TEXT,
        phone TEXT,
        type INT,
        fax TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<void> createTables(sql.Database database) async {
    await createSuivieTable(database);
    await createCarTable(database);
    await createUserTable(database);
    await createGarageTable(database);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'articars.db',
      version: 3,
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

  // SUIVIE

  static Future<int> createSuivie(String typeSuivie, String car, String date,
      String assurance, String policeNumber, String? image) async {
    final db = await SQLHelper.db();

    final data = {
      'typeSuivie': typeSuivie,
      'car': car,
      'date': date,
      'assurance': assurance,
      'police_number': policeNumber,
      'image': image,
      'createdAt': DateTime.now().toString()
    };
    final id = await db.insert('suivies', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getSuivies() async {
    final db = await SQLHelper.db();
    return db.query('suivies', orderBy: "id");
  }

  static Future<int> updateSuivie(int id, String typeSuivie, String car,
      String date, String assurance, String policeNumber, String? image) async {
    final db = await SQLHelper.db();

    final data = {
      'typeSuivie': typeSuivie,
      'car': car,
      'date': date,
      'assurance': assurance,
      'police_number': policeNumber,
      'image': image,
      'updatedAt': DateTime.now().toString()
    };

    final result =
        await db.update('suivies', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteSuivie(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("suivies", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint(
          "Quelque chose s'est mal passé lors de la suppression du suivi : $err");
    }
  }

  //User
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await SQLHelper.db();
    return db.query('users', orderBy: "id");
  }

  static Future<int> createUser(
    String userFirstName,
    String userLastName,
    String userSociety,
    String? userAddress,
    String? userLocation,
    String? userResponsible,
    String? userPhone,
    String? userFax,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'userSociety': userSociety,
      'userAddress': userAddress ?? '',
      'userLocation': userLocation ?? '',
      'userResponsible': userResponsible ?? '',
      'userPhone': userPhone ?? '',
      'userFax': userFax ?? '',
      'createdAt': DateTime.now().toString(),
    };
    final id = await db.insert(
      'users',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  // Read a single item by id
  static Future<User?> getUser(int id) async {
    final db = await SQLHelper.db();

    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return User(
        id: results[0]['id'],
        userFirstName: results[0]['userFirstName'],
        userLastName: results[0]['userLastName'],
      );
    } else {
      return null;
    }
  }
}

class User {
  final int id;
  final String userFirstName;
  final String userLastName;

  User({
    required this.id,
    required this.userFirstName,
    required this.userLastName,
  });
}
