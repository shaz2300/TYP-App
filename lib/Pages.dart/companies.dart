import 'package:flutter/material.dart';
import './home.dart';

class CompanyList extends StatelessWidget {
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
                child: Text('Company List',
                    textAlign: TextAlign.center,
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
          body: Container(
              child: PageView(
            controller: PageController(viewportFraction: 0.8),
            scrollDirection: Axis.vertical,
            pageSnapping: true,
            children: <Widget>[
              Container(  
                  padding: new EdgeInsets.only(top: 5.0),
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  color: Colors.cyan[100],
                  width: 100,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //SizedBox(height:1),
                      Image.asset('assets/darwin.png', height: 180, width: 180,alignment: Alignment.center,),
                      Text('DARWIN BOX',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                      SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                            "Student Aggregate Cutoff -> 70%\n2 phases ->\n   1.Coding exam\n   2.Telephonic / Skype Interview\nRequirements -> DBMS, Python, Java",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  color: Colors.cyan[100],
                  width: 100,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      Image.asset('assets/amazon.jpg', height: 130, width: 130),
                      SizedBox(height: 5),
                      Text('AMAZON',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                            "Package -> 19 lakh\nExam in all areas (Quant, Aptitude, Coding)\nTelephonic or Direct Interview\n\nAWS - Amazon Web Services \nPackage -> 23 lakh\nRequirements -> CN, CS, DBMS",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.cyan[100],
                //width: 100,
                child: Column(
                    children: <Widget>[
                      //SizedBox(height: 5),
                      Image.asset('assets/infosys.jpg', height: 150, width: 150),
                      Text('INFOSYS INFYTQ',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                            "2 ways for Package -> 3.6 lakh\n1. Infytq (cutoff 65%) -> \nRound 1) Screening test (Aptitude, Coding, DBMS)\nRound 2) Infytq exam (DBMS, Coding)\nRound 3) Direct HR interview\n2. On Campus Drive -> Aptitude, Reasoning and Verbal (must pass verbal)",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.cyan[100],
                //width: 100,
                child: Column(
                    children: <Widget>[
                      //SizedBox(height: 5),
                      Image.asset('assets/infosys.jpg', height: 150, width: 150),
                      Text('INFOSYS SE/PP',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                            "1. Hackwithinfy 2 rounds of only coding ->\nPackage -> 5 lakh\nRole -> Software Engineer\n2. Power Programmer (TR and HR rounds) ->\nPackage -> 8 lakh\nRequirements ->\nBe thorough with CN, CS, DLD, DBMS",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.cyan[100],
                width: 100,
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      Image.asset('assets/associates.jpg', height: 250, width: 250),
                      Text('APPS ASSOCIATES',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                            "Package -> 4 lakh\nCoding, Verbal and Aptitude Exam",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.cyan[100],
                width: 100,
                child: Column(
                    children: <Widget>[

                      Image.asset('assets/capg.png', height: 200, width: 200),
                      Text('CAPGEMINI',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                            "Package -> 3.6 lakh\nStudent Aggregate Cutoff -> 65%\nAptitude, Verbal and Reasoning Exam\nRequirements -> Min 2 Certifications",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.cyan[100],
                width: 100,
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      Image.asset('assets/associates.jpg', height: 250, width: 250),
                      Text('APPS ASSOCIATES',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                            "Package -> 4 lakh\nCoding, Verbal and Aptitude Exam",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.cyan[100],
                width: 100,
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      Image.asset('assets/associates.jpg', height: 250, width: 250),
                      Text('APPS ASSOCIATES',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                            "Package -> 4 lakh\nCoding, Verbal and Aptitude Exam",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.cyan[100],
                width: 100,
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      Image.asset('assets/associates.jpg', height: 250, width: 250),
                      Text('APPS ASSOCIATES',style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                            "Package -> 4 lakh\nCoding, Verbal and Aptitude Exam",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
              ),
            ],
          )),
        ));
  }
}
