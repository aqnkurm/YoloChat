import 'package:flutter/material.dart';
import 'package:yolochat/helper/authenticate.dart';
import 'package:yolochat/services/auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
          'Settings',
          ),
          elevation: 0.0,
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () {
                AuthService().signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.exit_to_app)),
            )
          ],
        ),
      body: Container(
        margin:EdgeInsets.all(90),
        child: Text(
          'Account'
      ),
      ),
    );
  }
}