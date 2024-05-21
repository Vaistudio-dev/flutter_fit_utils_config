import 'package:flutter_fit_utils/model/modelable.dart';

/// Basic configuration module.
abstract class Config extends Modelable {
  /// Initialize the config instance.
  /// This function should call [fetch] and [read] for the first time.
  Future<void> initialize();

  /// Retrieves the data for the configuration.
  Future<void> fetch();

  /// Reads the configuration and assigns the values to the corresponding fields.
  void read();

  /// Overrides the configuration with new values.
  void write();
}