import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';


class XYPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _XYPage1State();
  }
}

class _XYPage1State extends State<XYPage1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          SizedBox(height: 44,),
          InkWell(
            onTap: () {
              FlutterBoost.singleton.closeCurrent();
            },
            child: Image.asset("lib/images/1.JPG" , width: double.infinity, height: 64, fit: BoxFit.fill,),
          ),

          Expanded(
            child:    ListView(
              padding: EdgeInsets.only(top: 0),
              children: <Widget>[
                Image.asset("lib/images/11.jpg"),
                Image.asset("lib/images/22.jpg"),
                InkWell(
                  onTap: (){
                    FlutterBoost.singleton.open("XY2");
                  },
                  child:                 Image.asset("lib/images/33.jpg")

                )
              ],

            )
          )

        ],
      )

      ); // This trailing comma makes auto-formatting nicer for build methods.

  }
}


class XYPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _XYPage1State2();
  }



}

class _XYPage1State2 extends State<XYPage2> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Column(
          children: <Widget>[
            SizedBox(height: 44,),
            InkWell(
              onTap: (){
                FlutterBoost.singleton.closeCurrent();
              },
              child: Image.asset("lib/images/55.png" ,width: double.infinity, height: 64, fit: BoxFit.fill,),
            ),

            Expanded(

              child: ListView(

                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  Image.asset("lib/images/44.png" , fit: BoxFit.fill,),
                  InkWell(
                    onTap: (){
                        FlutterBoost.singleton.open("_ios_map");
                    },
                    child: Container(
                      color: Color(0xfff2f2f2),
                      child:     Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child:  Image.asset("lib/images/map.png" , height: 200, fit: BoxFit.fill,),
                      ),
                    )


                    
                   
                  ),
                ],
              )
            ),

          ],
        )


    ); // This trailing comma makes auto-formatting nicer for build methods.

  }
}
