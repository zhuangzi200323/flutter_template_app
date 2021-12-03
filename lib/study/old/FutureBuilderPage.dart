import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'LogUtil.dart';

class FutureBuilderPage extends StatefulWidget {
  _FutureBuilderPage createState() => _FutureBuilderPage();
}

class _FutureBuilderPage extends State<FutureBuilderPage> {
  var json = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilderPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            json,
          ),
          RaisedButton(
            child: Text("http request" ),
            onPressed: () {
              Future future = _getByHttpClient();
              future.then((value){
                setState(() {
                  json = value;
                });
              }).whenComplete((){
                print("request done");
              }).catchError((onError){
                print("request err" + onError.toString());
              });
            },
          ),
          FutureBuilder(
            future: _getByHttpClient(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              /*表示数据成功返回*/
              if (snapshot.hasData) {
                return Text("${snapshot}");
              } else {
                return LoadingWidget();
              }
            },
          )
        ],
      ),
    );
  }

  Widget LoadingWidget(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
        ],
    );
  }

  Future<String> _getByHttpClient() async{
    //接口地址
    const url="https://douban.uieee.com/v2/movie/in_theaters";

    //定义httpClient
    HttpClient client = new HttpClient();
    //定义request
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    //定义reponse
    HttpClientResponse response = await request.close();
    //respinse返回的数据，是字符串
    String responseBody = await response.transform(utf8.decoder).join();
    //关闭httpClient
    client.close();
    //字符串需要转化为JSON
    var json= jsonDecode(responseBody);
    LogUtil.v(json);
    return json.toString();
  }
}