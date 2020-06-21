import 'package:flutter/material.dart';
import 'dart:async';
import './after_splash.dart';

void main() => runApp(MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AfterSplash()
      )
      );
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(backgroundColor: Colors.white,
                  radius: 85.0,
                  child: 
                  Image.asset('assets/finally.jpg')
                  //Icon(Icons.shopping_cart,color: Colors.greenAccent,size: 50.0,),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text("Training in\nYour\nPalm",style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
                  )
                ],
                ),
                )
              ),
              Expanded(flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top:20.0),
                  ),
                  Text("Campus Placements helper \nfor Vignan Students", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),)
            ],
            )
        ],
      ),
    );
  }
} 
