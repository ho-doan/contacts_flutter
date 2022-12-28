import 'package:flutter/material.dart';

import 'package:contacts_flutter/contacts_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ContactModel> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final data = await ContactsFlutter.instance.getContacts();
                  setState(() => list = data);
                },
                child: const Text('get data'),
              ),
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
                          'name: ${contact.name}\n phone: ${contact.phone}')),
                )
            ],
          ),
        ),
      ),
    );
  }
}
