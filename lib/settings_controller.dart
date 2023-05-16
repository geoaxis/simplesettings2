import 'package:flutter/cupertino.dart';
import 'package:simplesettings2/settings_service.dart';

/// Interacts with services and provide observables that read or update settings.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  // Make SettingsService a private variable so it is not used directly. " Law of Demeter "
  final SettingsService _settingsService;

  late String server;

  SettingsController(this._settingsService);

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    server = _settingsService.server();
    //Inform listeners a change has occurred.
    notifyListeners();
  }


  /// Update and persist the counter to [newServer]
  Future<void> updateCounter(String newServer) async {
    //Change server
    server = newServer;
    //Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes
    await _settingsService.updateCounter(newServer);
  }
}