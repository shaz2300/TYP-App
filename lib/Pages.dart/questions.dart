import 'package:flutter/material.dart';
import './home.dart';

class QuestionPapers extends StatelessWidget {
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
                child: Text('Question Papers',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold))),
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Home(), fullscreenDialog: true));
              },
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        )
        );
  }
}