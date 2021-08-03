import 'package:flutter/material.dart';

import '../../modules/contacts/screens/home.dart';
import '../../modules/contacts/screens/create_contact.dart';
import '../../modules/contacts/screens/detail_contact.dart';

Map<String, Widget Function(BuildContext)> getContactsRoutes (BuildContext context) {
  return {
    '/': (context) => Home(),
    '/create-contact': (context) => CreateContact(),
    '/detail-contact': (context) => DetailContact(),
  };
}
