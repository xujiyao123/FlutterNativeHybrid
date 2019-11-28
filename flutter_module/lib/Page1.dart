import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/channel/boost_channel.dart';
import 'package:flutter_boost/container/boost_container.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/Page2.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.addContainerObserver((ContainerOperation operation, BoostContainerSettings settings) {



      print("operation--------${operation}");

    });

    FlutterBoost.singleton.addBoostContainerLifeCycleObserver((ContainerLifeCycle state, BoostContainerSettings settings) {
      if (state == ContainerLifeCycle.WillDisappear) {
        print("pop");
//        BoostChannel().sendEvent("pageback1", {"result" : "flutter页面回调信息"});
      }


      print("STATE--------${state}");
      print("settings--------- ${settings.params}");

    });






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
        middle: Text(widget.title , style: TextStyle(color: Colors.black),),
        leading: FlatButton(
          child: Icon(Icons.arrow_back_ios , size: 20, color: Colors.black,),
          onPressed: (){
            BoostContainerSettings settings =
                BoostContainer.of(context).settings;
            FlutterBoost.singleton.close(settings.uniqueId,
                result: {"result": "计数器数字是${_counter}次"});
        },
        ) ,
        backgroundColor: Colors.yellow,
        actionsForegroundColor: Colors.red,
        automaticallyImplyMiddle: false,
      ),

      body: Center(

        child: Column(

          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '第一个flutter页面',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              onPressed: () {
                  FlutterBoost.singleton.open("two");
              },
              child: Text("打开新的flutter页面"),
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