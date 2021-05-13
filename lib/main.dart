import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator...',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandonWords(),
    );
  }
}

class RandonWords extends StatefulWidget {
  @override
  _RandonWordsState createState() => _RandonWordsState();
}

class _RandonWordsState extends State<RandonWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator...'),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header', style: TextStyle(fontSize: 24.0, color: Colors.white, fontFamily: 'Font2')),
            ),
            ListTile(
              title: Text("Item one"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){},
            ),
            ListTile(
              title: Text("Item Two"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){},
            ),
            ListTile(
              title: Text("Item Three"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      // The itemBuilder callback is called
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles = _saved.map(
        (WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(context: context, tiles: tiles).toList()
          : <Widget>[];

      return Scaffold(
        appBar: AppBar(
          title: Text('Saved suggestions'),
          actions: [],
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }
}
