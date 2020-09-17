import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './companies.dart';
import './questions.dart';
import './contact.dart';
import './interviews.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      //appBar: AppBar(title: Text('Home', style: TextStyle(fontSize: 30.0),),backgroundColor: Colors.lightBlue[700],),
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Scaffold(
          backgroundColor: Colors.indigo[900],
          body: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.lightBlue[50],
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text('Home',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    color: Colors.lightBlue[50],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompanyList()));
                    },
                    child: Text('Company List',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    color: Colors.lightBlue[50],
                    onPressed: () async {
                      var globaldata = await http
                          .get('https://typapp-2db54.firebaseio.com/.json')
                          .then((http.Response response) {
                        var responseData = json.decode(response.body);
                        //print(responseData);
                        return responseData;
                      }).catchError((error) {
                        print(error);
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuestionPapers(globaldata)));
                    },
                    child: Text('Question Papers',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    color: Colors.lightBlue[50],
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ContactUs()));
                    },
                    child: Text('Contact us',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    color: Colors.lightBlue[50],
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InterviewStories()));
                    },
                    child: Text('Interview Stories',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.2 * screenWidth,
        child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
                animationDuration: duration,
                //borderRadius: BorderRadius.all(Radius.circular(40)),
                elevation: 8,
                color: Colors.lightBlue[300],
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                  child: Icon(Icons.menu, color: Colors.white),
                                  onTap: () {
                                    setState(() {
                                      if (isCollapsed)
                                        _controller.forward();
                                      else
                                        _controller.reverse();
                                      isCollapsed = !isCollapsed;
                                    });
                                  }),
                              Text("Home",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.settings, color: Colors.white),
                            ]),
                        SizedBox(height: 50),
                        Container(
                            height: 250,
                            child: PageView(
                              controller: PageController(viewportFraction: 0.8),
                              scrollDirection: Axis.horizontal,
                              pageSnapping: true,
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    color: Colors.redAccent,
                                    width: 100,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 5),
                                        Text("ABOUT US:",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                              "Need any information about the companies visiting Vignan and their requirments?\nCan't find the previous year question papers that may help you prepare and build confidence for your company written exam?\nWant to read your seniors Interview experiences?\nThen WELCOME TO TYP!",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    color: Colors.blueAccent,
                                    width: 100,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 5),
                                        Image.asset('assets/team.png',
                                            height: 130, width: 130),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                              "TYP - Training in your Palm\nis an app made exclusively for the benefit of Vignan students to help them train for placements. \n",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          'Contact Details of Vignan (Vtz) T&P',
                          style: TextStyle(
                              color: Colors.deepPurple[900],
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 5),
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(children: <Widget>[
                                ListTile(
                                  title: Text("Mr. K R Satyanarayan",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  subtitle: Text(
                                      "Dean- Training, Placement & Industrial Relations"),
                                  trailing: Text(
                                      "mob: 9866399942\nkrsn.deantp@gmail.com"),
                                ),
                                ListTile(
                                  title: Text("Mr. P.Prudvi Kiran",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  subtitle:
                                      Text("	Asst. Placement Officer, T&P"),
                                  trailing: Text(
                                      "mob: 9912513450\npasamprudhvi@gmail.com"),
                                ),
                                ListTile(
                                  title: Text("Dr. Rojeena Mathew",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  subtitle: Text(
                                      "Head Training & External Relations"),
                                  trailing: Text(
                                      "mob: 9573034678\nrojeena1@gmail.com"),
                                ),
                                ListTile(
                                  title: Text("Mr. Praveen N",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  subtitle: Text(
                                      "	Soft Skill Trainer / Technical Trainer"),
                                  trailing: Text("mob:	8050021899"),
                                ),
                                ListTile(
                                  title: Text("Mrs. Puja Prasad",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  subtitle: Text("Verbal Trainer"),
                                  trailing: Text("mob: 8919380347"),
                                ),
                                ListTile(
                                  title: Text("Mr. Nagendra P",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  subtitle: Text("Soft Skill Trainer"),
                                  trailing: Text("mob: 8019927612"),
                                ),
                                ListTile(
                                  title: Text("Mr. Santhosh",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  subtitle: Text("Quant Trainer"),
                                  trailing: Text("mob: 7702401817"),
                                ),
                                ListTile(
                                  title: Text("Mr. Rajesh",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  subtitle: Text("Technical Trainer"),
                                  trailing: Text("mob: 838788572"),
                                ),
                              ]);
                            },
                            separatorBuilder: (context, index) {
                              return Divider(height: 16);
                            },
                            itemCount: 1)
                      ],
                    ),
                  ),
                ))));
  }
}

/*class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      appBar: AppBar(title: Text('Home', style: TextStyle(fontSize: 30.0),),backgroundColor: Colors.lightBlue[700],
      ), //${widget.user.email}
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('users').document(user.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          switch(snapshot.connectionState){
            case ConnectionState.waiting: return Text('Loading... ');
            default:
              return checkRole(snapshot.data);
          }
        },
      ),
      );
  }
  Center checkRole(DocumentSnapshot snapshot) {
    if(snapshot.data['role'] == 'admin') {
      return adminPage(snapshot);
    }
    else{
      return userPage(snapshot);
    }
  }

  Center adminPage(DocumentSnapshot snapshot){
    return Center(child: Text('${snapshot.data['role']} ${snapshot.data['name']}'));
  }
  Center userPage(DocumentSnapshot snapshot){
    return Center(child: Text(snapshot.data['name']));
  }

}*/
