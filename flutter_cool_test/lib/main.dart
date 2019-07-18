import 'package:flutter/material.dart';
import 'gesture.dart';
import 'network.dart';
import 'NewsWebPage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return MaterialApp(
      title: "最外层的标题，找不到在哪",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <String>["JS错误", "卡顿", "网络请求", "加载网络图片", "手势", '加载网页'];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = new Set<String>();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Agent Flutter Demo'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          /// 每一列都添加一个1像素的分割线
          if (i.isOdd) {
            return new Divider();
          }

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
//            _suggestions.addAll(generateWordPairs().take(10));
            return null;
          }

          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(String pair) {

    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      onTap: () {
        setState(() {
          print(pair);
          if (pair == "JS错误") {
            _pushCrash();
//            _suggestions[1000000];
//            _saved.add(null);
//            _saved.remove(null);
//            Future.error("Oh, error!");
          }

          if (pair == "卡顿") {

            while (true) {
              print("111");
            }
          }

          if (pair == "加载网络图片") {
            _pushNetImage();
          }

          if (pair == "手势") {
            _pushGesture();
          }

          if (pair == "网络请求") {
            _pushNetwork();
          }

          if (pair == "加载网页") {
            Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (contest) => new NewsWebPage()
              )
            );
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (content) {
          final tiles = _saved.map(
                  (pair) {
                return new ListTile(
                  title: new Text(
                    pair,
                    style: _biggerFont,
                  ),
                );
              }
          );

          final divided = ListTile.divideTiles(
            tiles: tiles,
            context: content,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('收藏内容'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  void _pushCrash() {

    final _crashList = new Set<String>();
    _crashList.add("数组越界");
    _crashList.add("使用未定义变量");
    Navigator.of(context).push(

      new MaterialPageRoute(
        builder: (content) {

          final tiles = _crashList.map(
                  (pair) {
                return new ListTile(
                  title: new Text(
                    pair,
                    style: _biggerFont,
                  ),
                  onTap: () {
                    setState(() {
                      if (pair == "数组越界") {
                        _suggestions[1000000];
                      }

                      if (pair == "使用未定义变量") {
//                        print(a);
                      }
                    });
                  },
                );
              }
          );

          final divided = ListTile.divideTiles(
            tiles: tiles,
            context: content,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('崩溃列表'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  void _pushNetImage() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (content) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('网络图片'),
            ),
            body: new Image.network("https://user-gold-cdn.xitu.io/2019/4/13/16a154e59bd0a633?w=1018&h=334&f=jpeg&s=93914"),
          );
        },
      ),
    );
  }

  void _pushGesture() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (content) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('手势识别Widget'),
            ),
            body: new GestureDetectorWidget(),
          );
        },
      ),
    );
  }

  void _pushNetwork() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (content) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('网络请求'),
            ),
            body: new NetWorkWidget(),
          );
        },
      ),
    );
  }
}