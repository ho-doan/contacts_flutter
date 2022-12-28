// import 'package:flutter_test/flutter_test.dart';
// import 'package:contacts_flutter/contacts_flutter.dart';
// import 'package:contacts_flutter/contacts_flutter_platform_interface.dart';
// import 'package:contacts_flutter/contacts_flutter_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockContactsFlutterPlatform
//     with MockPlatformInterfaceMixin
//     implements ContactsFlutterPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final ContactsFlutterPlatform initialPlatform = ContactsFlutterPlatform.instance;

//   test('$MethodChannelContactsFlutter is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelContactsFlutter>());
//   });

//   test('getPlatformVersion', () async {
//     ContactsFlutter contactsFlutterPlugin = ContactsFlutter();
//     MockContactsFlutterPlatform fakePlatform = MockContactsFlutterPlatform();
//     ContactsFlutterPlatform.instance = fakePlatform;

//     expect(await contactsFlutterPlugin.getPlatformVersion(), '42');
//   });
// }
