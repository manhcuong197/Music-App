import 'package:brew_crew/screens/services/auth.dart';
import 'package:brew_crew/shared/contants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email='';
  String password='';
  String error ='';
  final _formKey=GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.redAccent,
        actions: [
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
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
                  decoration: textInputDecorate.copyWith(hintText: 'Email'),
                  validator: (value) => value.isEmpty?"Enter a mail":null,
                  onChanged: (value){
                    setState(() {
                      email=value;
                    });

                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  obscureText:  true,
                  decoration: textInputDecorate.copyWith(hintText: 'Password'),
                  validator: (value) => value.isEmpty?"Enter a password":null,
                  onChanged: (value){
                    setState(() {
                      password=value;
                    });
                  },
                ),
                SizedBox(height: 30.0),
                RaisedButton (
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result==null){
                        setState(() {
                          error="Enter a valid email";
                        });
                      }
                    }
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white60,

                    ),
                  ),
                  color: Colors.redAccent,
                ),
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
