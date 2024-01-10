import 'package:shared_preferences/shared_preferences.dart';

class DatabaseManager {
  static const String carImmatriculationKey = 'carImmatriculation';
  static const String carModelKey = 'carModel';
  static const String carTypeKey = 'carType';
  static const String numberKey = 'number';
  static const String colorKey = 'color';
  static const String dateKey = 'date';
  static const String tireTypeKey = 'tireType';
  static const String FuelTypeKey = 'tireFuel';
  static const String lastOwnerKey = 'lastOwner';

  static Future<void> saveCarData({
    required String immatriculation,
    required String model,
    required String type,
    required String number,
    required String color,
    required String date,
    required String tireType,
    required String typeFuel,
    required String lastOwner,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(carImmatriculationKey, immatriculation);
    prefs.setString(carModelKey, model);
    prefs.setString(carTypeKey, type);
    prefs.setString(numberKey, number);
    prefs.setString(colorKey, color);
    prefs.setString(dateKey, date);
    prefs.setString(tireTypeKey, tireType);
    prefs.setString(FuelTypeKey, typeFuel);
    prefs.setString(lastOwnerKey, lastOwner);
  }

  static Future<Map<String, String>> getCarData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      carImmatriculationKey: prefs.getString(carImmatriculationKey) ?? '',
      carModelKey: prefs.getString(carModelKey) ?? '',
      carTypeKey: prefs.getString(carTypeKey) ?? '',
      numberKey: prefs.getString(numberKey) ?? '',
      colorKey: prefs.getString(colorKey) ?? '',
      dateKey: prefs.getString(dateKey) ?? '',
      tireTypeKey: prefs.getString(tireTypeKey) ?? '',
      FuelTypeKey: prefs.getString(FuelTypeKey) ?? '',
      lastOwnerKey: prefs.getString(lastOwnerKey) ?? '',
    };
  }
}
