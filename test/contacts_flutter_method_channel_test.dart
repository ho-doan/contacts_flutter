// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:contacts_flutter/contacts_flutter_method_channel.dart';

// void main() {
//   MethodChannelContactsFlutter platform = MethodChannelContactsFlutter();
//   const MethodChannel channel = MethodChannel('contacts_flutter');

//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {
//     channel.setMockMethodCallHandler((MethodCall methodCall) async {
//       return '42';
//     });
//   });

//   tearDown(() {
//     channel.setMockMethodCallHandler(null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await platform.getPlatformVersion(), '42');
//   });
// }
