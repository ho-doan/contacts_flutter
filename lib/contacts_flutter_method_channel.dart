import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'contacts_flutter_platform_interface.dart';

/// An implementation of [ContactsFlutterPlatform] that uses method channels.
class MethodChannelContactsFlutter extends ContactsFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('contacts_flutter');

  @override
  Future<dynamic> getContacts() =>
      methodChannel.invokeMethod<dynamic>('getContacts');
}
