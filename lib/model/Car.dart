import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CarDatabase {
  late Database _database;
  static const String tableName = 'car_table';

  static const String carImmatriculationKey = 'carImmatriculation';
  static const String carModeleKey = 'carModele';
  static const String carTypeKey = 'carType';
  static const String carNumeroKey = 'carNumero';
  static const String carCouleurKey = 'carCouleur';
  static const String carDateKey = 'carDate';
  static const String carPneuKey = 'carPneu';
  static const String carProprioKey = 'carProprio';

  Future<void> initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            $carImmatriculationKey TEXT,
            $carModeleKey TEXT,
            $carTypeKey TEXT,
            $carNumeroKey TEXT,
            $carCouleurKey TEXT,
            $carDateKey TEXT,
            $carPneuKey TEXT,
            $carProprioKey TEXT,
          )
          ''',
        );
      },
      version: 1,
    );
  }

  Future<void> saveCarData({
    required String immatriculation,
    required String modele,
    required String type,
    required String numero,
    required String couleur,
    required String date,
    required String pneu,
    required String proprio,
  }) async {
    await _database.insert(
      tableName,
      {
        carImmatriculationKey: immatriculation,
        carModeleKey: modele,
        carTypeKey: type,
        carNumeroKey: numero,
        carCouleurKey: couleur,
        carDateKey: date,
        carPneuKey: pneu,
        carProprioKey: proprio,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, String>> getCarData() async {
    final List<Map<String, dynamic>> maps = await _database.query(tableName);
    if (maps.isEmpty) return {};

    return Map.from(maps.first);
  }

  Future<void> updateCarData(String immatriculation) async {
    await _database.update(
      tableName,
      {CarDatabase.carImmatriculationKey: immatriculation},
    );
  }

  Future<String?> getCarImmatriculation() async {
    final List<Map<String, dynamic>> maps = await _database.query(tableName);
    if (maps.isEmpty) return null;

    return maps.first[CarDatabase.carImmatriculationKey] as String?;
  }
}
