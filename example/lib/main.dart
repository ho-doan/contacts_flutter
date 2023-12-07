import 'package:flutter/material.dart';

import 'package:contacts_flutter/contacts_flutter.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ContactModel> list = [];

  void showDialogContacts(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => Material(
        child: Center(
          child: ListView(
            children: [
              for (final contact in list)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Text(
                      'name: ${contact.name}\n phone: ${contact.phones.join(',')}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    checkPermission(() => showDialogContacts(context));
  }

  void requestPer(VoidCallback callback) async {
    final request = await ContactsFlutter.instance.requestPermission();
    if (request) {
      readContact(callback);
    }
  }

  void checkPermission(VoidCallback callback) async {
    final checkPermission = await ContactsFlutter.instance.checkPermission();
    if (checkPermission) {
      readContact(callback);
    } else {
      requestPer(callback);
    }
  }

  void readContact(VoidCallback callback) async {
    final data = await ContactsFlutter.instance.getContacts();
    setState(() => list = data);
    callback.call();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => onTap(context),
            child: const Text('get data'),
          ),
        ),
      ),
    );
  }
}
