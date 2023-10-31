import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_ukit_platform_interface.dart';

/// An implementation of [FlutterUkitPlatform] that uses method channels.
class MethodChannelFlutterUkit extends FlutterUkitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_ukit');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
