import 'package:flutter/material.dart';
import './Setup/signin.dart';
import './Setup/signup.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light, primarySwatch: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[300],
        appBar: AppBar(
            backgroundColor: Colors.lightBlue[700],
            title: Center(
                child: Text('TYP',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('assets/loginpc.png', height: 200, width: 200),
            SizedBox(height: 50),
            RaisedButton(
              color: Colors.lightBlue[50],
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage(),)); 
              },
              child: Text('Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text(' or ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold)),
            ),
            RaisedButton(
              color: Colors.lightBlue[50],
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text('Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
