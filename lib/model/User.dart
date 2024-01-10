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
  static const String carImmatriculationKey = 'carImmatriculation';

  Future<void> initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            $userFirstNameKey TEXT,
            $userAddressKey TEXT,
            $userLocationKey TEXT,
            $userResponsibleKey TEXT,
            $userPhoneKey TEXT,
            $userFaxKey TEXT,
            $carImmatriculationKey TEXT
          )
          ''',
        );
      },
      version: 1,
    );
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
        UserDatabase.userFirstNameKey: firstName,
        UserDatabase.userAddressKey: address,
        UserDatabase.userLocationKey: location,
        UserDatabase.userResponsibleKey: responsible,
        UserDatabase.userPhoneKey: phone,
        UserDatabase.userFaxKey: fax,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, String>> getUserData() async {
    final List<Map<String, dynamic>> maps = await _database.query(tableName);
    if (maps.isEmpty) return {};

    return Map.from(maps.first);
  }

  Future<void> saveCarData(String immatriculation) async {
    await _database.update(
      tableName,
      {UserDatabase.carImmatriculationKey: immatriculation},
    );
  }

  Future<String?> getCarImmatriculation() async {
    final List<Map<String, dynamic>> maps = await _database.query(tableName);
    if (maps.isEmpty) return null;

    return maps.first[UserDatabase.carImmatriculationKey] as String?;
  }
}

  // Map<String, String> userData = await userDatabase.getUserData();
  // print('User Data: $userData');

  // await userDatabase.saveCarData('ABC123');

  // String? carImmatriculation = await userDatabase.getCarImmatriculation();
  // print('Car Immatriculation: $carImmatriculation');