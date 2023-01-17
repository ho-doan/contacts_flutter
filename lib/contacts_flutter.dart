import 'package:contacts_flutter/models/contact_model.dart';

import 'contacts_flutter_platform_interface.dart';

export 'models/contact_model.dart';

class ContactsFlutter {
  ContactsFlutter._();
  static final instance = ContactsFlutter._();
  Future<List<ContactModel>> getContacts() async {
    final data = await ContactsFlutterPlatform.instance.getContacts();
    if (data == null) return [];
    return (data as List).map((e) => ContactModel.fromJson(e)).toList();
  }

  Future<bool> checkPermission() =>
      ContactsFlutterPlatform.instance.checkPermission();
  Future<bool> requestPermission() =>
      ContactsFlutterPlatform.instance.requestPermission();
}
