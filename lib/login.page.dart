import 'package:flutter/material.dart';
import 'components/my_textfield.dart';
import 'components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

   //text editing controllers
   final usernameController = TextEditingController();
   final passwordController = TextEditingController();

   //sign user in
   void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'RECYCLER',
                        textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900], fontSize: 20),
                      ),
                    ),
                    Image.asset(
                      'assets/w.png',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  children: [
                    Image.asset("assets/recyclingman.png", height: 250, width: 250),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]) ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),

            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
              controller: usernameController,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
              ),

              SizedBox(
                  height: 5
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),

              MyButton(
                onTap: signUserIn,
              ),

              SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}