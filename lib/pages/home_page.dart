import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
              onPressed: signUserOut,
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("LOGGED IN AS " + user.email!, style: TextStyle(fontSize: 20),),
      )
    );
  }
}
