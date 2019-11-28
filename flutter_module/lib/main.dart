import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/Page1.dart';
import 'package:flutter_module/Page2.dart';
import 'package:flutter_module/push_page.dart';
import 'package:flutter_module/xypage.dart';

void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {

    print(uniqueId);

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      home:Container()
    );
  }

  @override
  void initState() {
      super.initState();

      FlutterBoost.singleton.registerPageBuilders({
//        "first" : (pageName , paras ,_) {
//          print(pageName);
//          print(paras);
//          return MyHomePage(title : paras['name']);
//        } ,
        'two': (pageName, params, _) => SecondPage(),
        'first': (pageName, params, _) => MyHomePage(title: params['name'],),
        "push" : (n,p,_) => PushPage(name: p['name'],),
        "push2" : (n,p,_) => PushPage2(),
        "XY1" : (n,p,_) => XYPage1(),
        "XY2" : (n,p,_) => XYPage2(),


      });

  }
}
