import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'contacts_flutter_method_channel.dart';

abstract class ContactsFlutterPlatform extends PlatformInterface {
  /// Constructs a ContactsFlutterPlatform.
  ContactsFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ContactsFlutterPlatform _instance = MethodChannelContactsFlutter();

  /// The default instance of [ContactsFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelContactsFlutter].
  static ContactsFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ContactsFlutterPlatform] when
  /// they register themselves.
  static set instance(ContactsFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<dynamic> getContacts() {
    throw UnimplementedError('getContacts() has not been implemented.');
  }

  Future<bool> checkPermission() {
    throw UnimplementedError('checkPermission() has not been implemented.');
  }

  Future<bool> requestPermission() {
    throw UnimplementedError('requestPermission() has not been implemented.');
  }
}
