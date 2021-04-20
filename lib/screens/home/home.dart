import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = new AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Brew'),
        backgroundColor: Colors.brown,
        elevation: 2.0,
        actions: [
          FlatButton.icon(
              onPressed: () async{
                 await _auth.signOutAnon();
              },
              icon: Icon(Icons.person),
              label: Text('logout')
          )
        ],
      ),
    );
  }
}
