import 'package:shared_preferences/shared_preferences.dart';

class User {
  static const String userFirstNameKey = 'userFirstName';
  static const String userAddressKey = 'userAddress';
  static const String userLocationKey = 'userLocation';
  static const String userResponsibleKey = 'userResponsible';
  static const String userPhoneKey = 'userPhone';
  static const String userFaxKey = 'userFax';

  static const String carImmatriculationKey = 'carImmatriculation';

// enregistrer les information de la personne
  static Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String address,
    required String location,
    required String responsible,
    required String phone,
    required String fax,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(userFirstNameKey, firstName);
    prefs.setString(userAddressKey, address);
    prefs.setString(userLocationKey, location);
    prefs.setString(userResponsibleKey, responsible);
    prefs.setString(userPhoneKey, phone);
    prefs.setString(userFaxKey, fax);
  }

//avoir les informations de la personne
  static Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      userFirstNameKey: prefs.getString(userFirstNameKey) ?? '',
      userAddressKey: prefs.getString(userAddressKey) ?? '',
      userLocationKey: prefs.getString(userLocationKey) ?? '',
      userResponsibleKey: prefs.getString(userResponsibleKey) ?? '',
      userPhoneKey: prefs.getString(userPhoneKey) ?? '',
      userFaxKey: prefs.getString(userFaxKey) ?? '',
    };
  }

  static Future<void> saveCarData(String immatriculation) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(carImmatriculationKey, immatriculation);
  }

  static Future<String?> getCarImmatriculation() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(carImmatriculationKey);
  }
}
