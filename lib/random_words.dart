import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RandomWordsState();
  }
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Startup name generator'),
        ),
        body: _buildSuggestions(),
      );

  Widget _buildSuggestions() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            return const Divider();
          }
          final suggestionIndex = index ~/ 2;
          if (suggestionIndex >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[suggestionIndex]);
        },
      );

  Widget _buildRow(WordPair wordPair) {
    final isAlreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        isAlreadySaved ? Icons.favorite : Icons.favorite_border,
        color: isAlreadySaved ? Colors.red : null,
        semanticLabel: isAlreadySaved ? 'Remove from saved' : 'Save',
      ),
      onTap: () => setState(() {
        if (isAlreadySaved) {
          _saved.remove(wordPair);
        } else {
          _saved.add(wordPair);
        }
      }),
    );
  }
}
