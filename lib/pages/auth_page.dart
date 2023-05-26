import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/pages/login.page.dart';
import 'home_page.dart';
import 'package:recycle_app/main.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //is user logged in or not
          if (snapshot.hasData){
            return HomePage();
          }
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
