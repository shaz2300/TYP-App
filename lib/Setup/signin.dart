import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:typapp/Pages.dart/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _pass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[700],
          title: 
             Text('Login',style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold))
                  ),
                    
        body: Form(
          key: _formKey,
          child: Column(children: <Widget>[
          SizedBox(height: 80),
          TextFormField
          (validator: (input){
            if(input.isEmpty){
              return 'Please enter your Email id';
            }
          },
          onSaved: (input) => _email = input,
          decoration: InputDecoration(labelText: 'Enter Email', border: const OutlineInputBorder()),
          ),
          SizedBox(height: 10),
          TextFormField
          (validator: (input){
            if(input.length<10){
              return 'Please enter your full Registration id';
            }
          },
          onSaved: (input) => _pass = input,
          decoration: InputDecoration(labelText: 'Enter Password (your Registration id)', border: const OutlineInputBorder()),
          obscureText: true,
          ),
          SizedBox(height:30),
          RaisedButton(
            onPressed: signIn,
            child: Text('Sign in',style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold))
          ),
        ],),),
    );
  }

  void signIn() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user= (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _pass)).user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }
      catch(e){
        print(e.message);
      }

    }
  }

}
