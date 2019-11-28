import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/channel/boost_channel.dart';
import 'package:flutter_boost/container/boost_container.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondPageState();
  }




}

class _SecondPageState extends State<SecondPage> {
  int _counter = 0;


  @override
  void initState() {
    super.initState();

//    FlutterBoost.singleton.addContainerObserver((ContainerOperation operation, BoostContainerSettings settings) {
//
//
//
//      print("operation--------${operation}");
//
//    });
//
//    FlutterBoost.singleton.addBoostContainerLifeCycleObserver((ContainerLifeCycle state, BoostContainerSettings settings) {
//
//
//
//      print("STATE--------${state}");
//      print("settings--------- ${settings.params}");
//
//    });






  }

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CupertinoNavigationBar(
        middle: Text("123" , style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow,
        actionsForegroundColor: Colors.red,
        leading: FlatButton(
          child: Icon(Icons.arrow_back_ios , size: 20, color: Colors.black,),
          onPressed: (){
            BoostContainerSettings settings =
                BoostContainer.of(context).settings;
            FlutterBoost.singleton.close(settings.uniqueId,
                result: {"result": "data from second"});
          },
        ) ,
      ),

      body: Center(

        child: Column(

          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '这是第二个flutter页面',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              onPressed: () {
                FlutterBoost.singleton.open("_ios_Second" , urlParams: {"result" : "计数器数字是${_counter}次"} , exts: {"title" : "ios page"});
              },
              child: Text("打开一个原生页面"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}