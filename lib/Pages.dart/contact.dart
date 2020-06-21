import 'package:flutter/material.dart';
import './home.dart';

class ContactUs extends StatelessWidget {
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
                child: Text('Contact Us',
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
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40,),
            Center(child:Image.asset('assets/contactpc.png', height: 150, width: 150,alignment: Alignment.center,),),
            SizedBox(height: 30,),
            Padding(
          padding: const EdgeInsets.only(left: 10.0),
            child:Text('For any queries or issues that you may be facing, contact the following:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        ))
                        ),
            SizedBox(height: 25),
            Padding(
          padding: const EdgeInsets.only(left: 10.0),
            child: Row( 
              children: [
            Text('Email : typsupport@gmail.com    ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        )),
            Icon(Icons.email, color: Colors.black)
            ])),
            SizedBox(height: 5,),
            Padding( padding: const EdgeInsets.only(left: 10.0),
            child: Row( 
              children: [
            Text('Call : +917356708498    ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        )),
            Icon(Icons.call, color: Colors.black)
            ])),
          ]),
        )
        );
  }
}