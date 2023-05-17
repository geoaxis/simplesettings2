import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// This class persists its data via SharedPreferences plugin
class SettingsService {
  final SharedPreferences _sharedPreferences;

  SettingsService(this._sharedPreferences);

  /// Loads the User's last saved server value
  String server() {
    bool CheckValue =  _sharedPreferences.containsKey('server');
    if (CheckValue == false) {
      return 'https://api.example.com/';
    }

    String server = _sharedPreferences.getString('server')!.trim();
    if (server.length == 0) {
      return 'https://api.example.com/';
    } else {
      return server;
    }
  }


  /// Updates the server value
  Future<bool> updateCounter(String newValue) => _sharedPreferences.setString('server', '$newValue');
}
