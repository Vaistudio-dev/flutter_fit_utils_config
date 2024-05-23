import 'package:flutter_fit_utils_config/remote_config.dart';

Future<void> main() async {
  final CharacterConfig characterConfig = CharacterConfig();
  await characterConfig.initialize();

  final OtherConfig config = OtherConfig();
  config.read();
}

/// Example config class.
class CharacterConfig extends RemoteConfig {
  int speed = 0;
  int attack = 0;

  @override
  void read() {
    speed = appConfig.getInt("speed");
    attack = appConfig.getInt("attack");
  }
}

/// Example config class.
class OtherConfig extends RemoteConfig {
  int stuff = 0;

  @override
  void read() {
    stuff = appConfig.getInt("stuff");
  }
}