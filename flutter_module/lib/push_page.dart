import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/channel/boost_channel.dart';
import 'package:flutter_boost/container/boost_container.dart';
import 'package:flutter_boost/flutter_boost.dart';

class PushPage extends StatefulWidget {
  final String name;

  PushPage({this.name});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PushPageState();
  }
}

class _PushPageState extends State<PushPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CupertinoNavigationBar(
        middle: Text("new flutter page" , style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow,
        actionsForegroundColor: Colors.red,
        leading: FlatButton(
          child: Icon(Icons.arrow_back_ios , size: 20, color: Colors.black,),
          onPressed: (){

            FlutterBoost.singleton.closeCurrent(result: {"result": "data from second"});
          },
        ) ,
      ),

      body: Center(

        child: Column(

          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.name,
            ),
            FlatButton(
              color: Colors.yellow,
              onPressed: () {
                FlutterBoost.singleton.open("_ios_Second" , urlParams: {"result" : "flutterpush来的新ios页面"} , exts: {"title" : "ios page"});
              },
              child: Text("打开一个原生页面" ),
            ),
            FlatButton(
              color: Colors.yellow,
              onPressed: () {
                FlutterBoost.singleton.open("push" , urlParams: {'name' : 'flutter push 过来的 flutter 页面'});
              },
              child: Text("打开一个flutter页面"),
            )
          ],
        ),
      ),
    );
  }
}



class PushPage2 extends StatefulWidget {


  PushPage2();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PushPage2State();
  }
}

class _PushPage2State extends State<PushPage2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("1231"),),

      body: Center(

        child: Column(

          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.yellow,
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => PushPage2()));
              },
              child: Text("打开一个flutter页面"),
            ),
            FlatButton(
              color: Colors.yellow,
              onPressed: () {
                FlutterBoost.singleton.closeCurrent();
              },
              child: Text("关闭flutter栈"),
            )
          ],
        ),
      ),
    );
  }
}