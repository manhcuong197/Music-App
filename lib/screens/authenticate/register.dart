import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email='';
  String password='';
  String repassword='';
  String error ='';
  final _formKey=GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Brew'),
          backgroundColor: Colors.white60,
          actions: [
            FlatButton.icon(
                onPressed: (){
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Sign in'))
          ],
        ),
        body: Container(
          padding:EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0) ,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15.0),
                  TextFormField(
                    validator: (value) => value.length<6 ?
                    "Enter email > 6" : null,
                    onChanged: (value){
                      setState(() {
                        email=value;
                      });

                    },
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    obscureText:  true,
                    validator: (value) => value.length<6 ?
                    "Enter password > 6" : null

                    ,
                    onChanged: (value){
                      setState(() {
                        password=value;
                      });
                    },
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    obscureText:  true,
                    validator: (value) => (value != password ) ?
                    "Enter the password incorrectly " : null

                    ,
                    onChanged: (value){
                      setState(() {
                        repassword=value;
                      });
                    },
                  ),
                  SizedBox(height: 30.0),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error="Please enter a valid email address";
                          });
                        }
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white60,

                      ),
                    ),
                    color: Colors.redAccent,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )

                ],
              ),
            ),
          ),

        )
    );
  }
}
