import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NetWorkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '网络请求',
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('发起网络请求'),
            onPressed: () {
              _getData();
            },
          ),
        ),
      ),
    );
  }

  void _getData() async {

//    String address = "https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=10&client=&udid=";
    var uri = Uri.https("api.douban.com", "/v2/movie/in_theaters", {"apikey":"0b2bdeda43b5688921839c8ecb20399b", "city": "%E6%B7%B1%E5%9C%B3", "start": "0", "count": "10", "client": "", "udid": ""});

    var response = await Dio().getUri(uri);

    print(response);
  }
}