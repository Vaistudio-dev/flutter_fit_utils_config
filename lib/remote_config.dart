import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_fit_utils_config/config.dart';

/// Wrapper for a Firebase Remote Config.
/// Before creating an instance, make sure to call Firebase.initializeApp().
abstract class RemoteConfig extends Config {
  /// Instance of the Firebase Remote Config.
  final FirebaseRemoteConfig appConfig = FirebaseRemoteConfig.instance;

  @override
  Future<void> initialize() async {
    await fetch();
    read();

    appConfig.onConfigUpdated.listen(
      (event) async {
        await appConfig.activate();
        read();
      },
      onError: (e) {},
    );
  }

  @override
  Future<void> fetch() async {
    try {
      await appConfig.fetchAndActivate();
    } on Exception catch (e) {
      if (e.toString().contains("request timed out")) {
        await fetch();
      }

      return;
    }
  }

  List<String> readStringList(String key) {
    final String value = appConfig.getString(key);
    if (value.isEmpty) {
      return [];
    }

    if (jsonDecode(value) case final List<dynamic> list) {
      return list.map((e) => e.toString()).toList();
    }

    return [];
  }
}
