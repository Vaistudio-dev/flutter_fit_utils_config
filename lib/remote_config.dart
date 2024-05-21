import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_fit_utils/model/model.dart';
import 'package:flutter_fit_utils/model/modelable.dart';
import 'package:flutter_fit_utils_config/config.dart';

/// Wrapper for a Firebase Remote Config.
/// Before creating an instance, make sure to call Firebase.initializeApp().
abstract class RemoteConfig extends Config {
  /// Instance of the Firebase Remote Config.
  final FirebaseRemoteConfig appConfig = FirebaseRemoteConfig.instance;

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<void> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  void read() {
    // TODO: implement read
  }

  @override
  void write() {
    // TODO: implement write
  }

  @override
  Modelable copyWith({String? id, String? userId}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  Model toModel() {
    // TODO: implement toModel
    throw UnimplementedError();
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