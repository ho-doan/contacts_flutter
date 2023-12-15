import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'contacts_flutter_platform_interface.dart';

/// An implementation of [ContactsFlutterPlatform] that uses method channels.
class MethodChannelContactsFlutter extends ContactsFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('contacts_flutter');
  @visibleForTesting
  final methodPerChannel = const MethodChannel('contacts_flutter/per')
    ..setMethodCallHandler((call) async {
      switch (call.method) {
        case 'permissionResult':
          {
            _completerPer.complete(call.arguments as bool);
          }
      }
    });

  @override
  Future<dynamic> getContacts() =>
      methodChannel.invokeMethod<dynamic>('getContacts');
  @override
  Future<bool> checkPermission() async {
    final data = await methodChannel.invokeMethod<bool>('checkPermission');
    return data ?? false;
  }

  static final Completer<bool> _completerPer = Completer<bool>();

  @override
  Future<bool> requestPermission() async {
    final data = await methodChannel.invokeMethod<bool>('requestPermission');
    if (data != null) return data;
    return await _completerPer.future;
  }
}
