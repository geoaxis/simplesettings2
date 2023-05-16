import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplesettings2/settings_controller.dart';
import 'package:simplesettings2/settings_service.dart';

import 'dart:io';


void main() async {
  // Ensures plugins can be accessed.
  WidgetsFlutterBinding.ensureInitialized();
// Initialize the SharedPreferences
  final sp = await SharedPreferences.getInstance();
// Create the settingsController that will in the end glue the settings with the UI.
  final settingsController = SettingsController(SettingsService(sp))
    ..loadSettings();

  runApp(MaterialApp(
    title: 'Settings Demo',
    theme: ThemeData(primarySwatch: Colors.indigo),
    home: MyHomePage(controller: settingsController, title: 'Settings Demo'),
  ));
}

class MyHomePage extends StatelessWidget {
  final SettingsController controller;

  const MyHomePage({super.key, required this.title, required this.controller});

  final String title;

  String get server => controller.server;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Simple Settings")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Text('$server',
                        style: Theme.of(context).textTheme.bodyLarge);
                  }),
              ElevatedButton(
                onPressed: () => AppSettings.openDevelopmentSettings(), 
                child: Text('Open dev settings'),
              )
            ],
          ),
        ));
  }
}
