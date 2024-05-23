A flutter package to easily manage configurations. This package is part of the flutter_fit_utils environement.

![flutter_fit_utils relations](https://github.com/s0punk/flutter_fit_utils/assets/59456672/2747cb84-1c06-4c5a-9b45-8db18977ac77)

## Features

Use this package to:
- Get uniform classes for your different configurations
- Create configurations issued from Firebase Remote Config

## Getting started

- Go inside your pubspec.yaml file
- Add this line under the dependencies:
```
    flutter_fit_utils_config: ^1.0.0
```
- Get dependencies
```
flutter pub get
```

## Usage

To read values from your Firebase Remote Config, simply create a class that extends RemoteConfig:

```dart
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
```

To read your configuration, simply call initialize():
```dart
final CharacterConfig characterConfig = CharacterConfig();
await characterConfig.initialize();
```

Note that all RemoteConfig share the same FirebaseRemoteConfig instance. So once initialized is called on ANY RemoteConfig instance,
you don't have to call it again for other instances:
```dart
final CharacterConfig characterConfig = CharacterConfig();
await characterConfig.initialize();

final CharacterConfig otherConfig = CharacterConfig();
otherConfig.read();
```

For the instances that don't call initialize(), make sure to call read() instead.

## Additional information

Feel free to [give any feedback](https://github.com/s0punk/flutter_fit_utils_config/issues) ! This package is also open to contributions.
