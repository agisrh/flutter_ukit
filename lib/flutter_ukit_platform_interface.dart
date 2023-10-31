import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ukit_method_channel.dart';

abstract class FlutterUkitPlatform extends PlatformInterface {
  /// Constructs a FlutterUkitPlatform.
  FlutterUkitPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterUkitPlatform _instance = MethodChannelFlutterUkit();

  /// The default instance of [FlutterUkitPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterUkit].
  static FlutterUkitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterUkitPlatform] when
  /// they register themselves.
  static set instance(FlutterUkitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
