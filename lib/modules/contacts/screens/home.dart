import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{}; // get users saved words
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  // build method only need to return a widget
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts list'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              tooltip: 'Add contact',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/create-contact',
                );
              }
            ),
            IconButton(
              icon: Icon(Icons.more),
              tooltip: 'Detail contact',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/create-contact',
                );
              }
            ),
          ]
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
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // list style
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

}