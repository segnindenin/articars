import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase {
  late Database _database;
  static const String tableName = 'user_table';

  static const String userFirstNameKey = 'userFirstName';
  static const String userAddressKey = 'userAddress';
  static const String userLocationKey = 'userLocation';
  static const String userResponsibleKey = 'userResponsible';
  static const String userPhoneKey = 'userPhone';
  static const String userFaxKey = 'userFax';

  Future<void> initializeDatabase() async {
    debugPrint('Initializing database...');
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        debugPrint('Creating user_table...');
        return db.execute(
          '''
        CREATE TABLE $tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          $userFirstNameKey TEXT,
          $userAddressKey TEXT,
          $userLocationKey TEXT,
          $userResponsibleKey TEXT,
          $userPhoneKey TEXT,
          $userFaxKey TEXT
        )
        ''',
        );
      },
      version: 1,
    );
    debugPrint('Database initialized.');
  }

  Future<void> saveUserData({
    required String firstName,
    required String address,
    required String location,
    required String responsible,
    required String phone,
    required String fax,
  }) async {
    await _database.insert(
      tableName,
      {
        userFirstNameKey: firstName,
        userAddressKey: address,
        userLocationKey: location,
        userResponsibleKey: responsible,
        userPhoneKey: phone,
        userFaxKey: fax,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
