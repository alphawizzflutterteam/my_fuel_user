import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Global private constants
  static String kTokenKey = 'token';
  static String kLanguageKey = 'language_type';
  String _kThemeColorKey = 'theme_color';
  static SharedPreferencesService? _instance;
  static late SharedPreferences _prefs;
  SharedPreferencesService._();

  /// Using Class  https://isaacadariku.medium.com/storing-and-retrieving-data-in-flutter-with-shared-preferences-in-a-maintainable-way-cf75eed6dbe2
  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _prefs = await SharedPreferences.getInstance();

    return _instance!;
  }

  // Private generic method for retrieving data from shared preferences
  dynamic getData(String key) {
    // Retrieve data from shared preferences
    var value = _prefs.get(key);

    // Easily log the data that we retrieve from shared preferences
    print('Retrieved $key: $value');

    // Return the data that we retrieve from shared preferences
    return value;
  }

  // Private generic method for retrieving data from shared preferences
  void clear() {
    // Retrieve data from shared preferences
    var value = _prefs.clear();

    // Easily log the data that we retrieve from shared preferences

    // Return the data that we retrieve from shared preferences
  }

  // Private method for saving data to shared preferences
  void saveData(String key, dynamic value) {
    // Easily log the data that we save to shared preferences
    print('Saving $key: $value');

    _prefs.setString(key, value.toString());
    // Save data to shared preferences
    // if (value is String) {
    //   _prefs.setString(key, value);
    // } else if (value is int) {
    //   _prefs.setInt(key, value);
    // } else if (value is double) {
    //   _prefs.setDouble(key, value);
    // } else if (value is bool) {
    //   _prefs.setBool(key, value);
    // } else if (value is List<String>) {
    //   _prefs.setStringList(key, value);
    // }
  }
}
