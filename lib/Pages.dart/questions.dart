import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
//import 'package:universal_html/html.dart' as html;
import './home.dart';
//import 'package:http/http.dart' as http;

class QuestionPapers extends StatefulWidget {
  final globaldata;
  QuestionPapers(this.globaldata);
  @override
  _QuestionPapersState createState() => _QuestionPapersState(globaldata);
}

class _QuestionPapersState extends State<QuestionPapers> {
  final globaldata;
  _QuestionPapersState(this.globaldata);
  var keys;
  var values;

  makeList() {
    keys = globaldata.keys.toList();
    values = globaldata.values.toList();
    print(keys);
  }

  @override
  Widget build(BuildContext context) {
    makeList();

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
        body: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: keys.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: RaisedButton(
                  child: Text('${keys[index]}'),
                  onPressed: () async {
                    var url = values[index];
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                    //html.window.open(values[index],'papers');
                    //await launch(values[index]);
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
