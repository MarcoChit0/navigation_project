import 'package:flutter/material.dart';

import 'config/routes/contacts.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getContactsRoutes(context),
      initialRoute: '/',
    );
  }
}