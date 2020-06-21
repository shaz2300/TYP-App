import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:typapp/Setup/signin.dart';

class SignUp extends StatefulWidget {
  @override 
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
 String _email, _pass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[700],
          title: 
             Text('Sign Up New User',style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold))
                  ),
                    
        body: Form(
          key: _formKey,
          child: Column(children: <Widget>[
          SizedBox(height: 10),
          Text('Enter a valid email id and ensure that your password is your entire registration id \neg. 17L31A0***',style: TextStyle(color: Colors.black,fontSize: 18.0) ),
          SizedBox(height: 25),
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
          SizedBox(height:20),
          RaisedButton(
            onPressed: signUp,
            child: Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold))
          ),
          //SizedBox(height:10),
          Text('*After Sign Up, please check your registered email to verify your account and Sign In*',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontSize: 18.0))
          
        ],),),
    );
  }

  void signUp() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _pass)).user;
        user.sendEmailVerification(); //displays user that mail sent for verification
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }
      catch(e){
        print(e.message);
      }

    }
  }
}