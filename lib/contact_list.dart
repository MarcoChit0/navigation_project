import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:navigation_project/contact.dart';
// every dart program starts
// everything in flutter is an widget
// you build your program composing widgets
void main() => runApp(MyApp());

// StatelessWidget -> does not have any memory
// StatefulWidget -> need to have memory to hold state
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomContacts(),
    );
  }}

class RandomContacts extends StatefulWidget {
  const RandomContacts({Key? key}) : super(key: key);

  @override
  _RandomContactsState createState() => _RandomContactsState();
}

class _RandomContactsState extends State<RandomContacts> {
  final _suggestions = <Contact>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  // build method only need to return a widget
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Contact Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      // little nicer
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(RandomContactList(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  // list style
  Widget _buildRow(Contact my_contact) {
    return ListTile(
      title: Text(
        my_contact.name,
      ),
    );
  }

}

