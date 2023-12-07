import 'contacts_flutter_platform_interface.dart';

import 'src/generated/contacts_sdk.pb.dart' as pb;

export 'src/generated/contacts_sdk.pb.dart';

class ContactsFlutter {
  ContactsFlutter._();
  static final instance = ContactsFlutter._();
  Future<List<pb.ContactModel>> getContacts() async {
    final data = await ContactsFlutterPlatform.instance.getContacts();
    print(data);
    if (data == null) return [];
    final result = pb.ContactListModel.fromBuffer(data);
    return result.contacts;
  }

  Future<bool> checkPermission() =>
      ContactsFlutterPlatform.instance.checkPermission();
  Future<bool> requestPermission() =>
      ContactsFlutterPlatform.instance.requestPermission();
}
