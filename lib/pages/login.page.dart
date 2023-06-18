import 'package:flutter/material.dart';
import '../components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   //text editing controllers
   final emailOrUsernameController = TextEditingController();
   final passwordController = TextEditingController();

   //sign user in
   void signUserIn() async {
   //show loading circle
   showDialog(
     context: context,
     builder: (context) {
     return const Center(
       child: CircularProgressIndicator(),
     );
   },
   );

   // try signing in
   try {
     // Check if the user entered an email or a username
     final String emailOrUsername = emailOrUsernameController.text;
     final isEmail = emailOrUsername.contains('@');

     UserCredential userCredential;
     if (isEmail) {
       // Sign in with email
       userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailOrUsername,
         password: passwordController.text,
       );
     } else {
       // Sign in with username
       final QuerySnapshot snapshot = await FirebaseFirestore.instance
           .collection('users')
           .where('username', isEqualTo: emailOrUsername)
           .limit(1)
           .get();

       if (snapshot.docs.isNotEmpty) {
         final String email = snapshot.docs.first.get('email');
         userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: email,
           password: passwordController.text,
         );
       } else {
         // No user found with the entered username
         throw FirebaseAuthException(code: 'user-not-found');
       }
     }

     // User signed in successfully, handle the login completion, e.g., navigate to the next screen.
   } on FirebaseAuthException catch (e) {
     // Sign in failed, show an error message
     showErrorMessage(e.code);
   }

   // Close the loading dialog
   Navigator.pop(context);
   }
   
   //error message to user
   void showErrorMessage(String message){
     showDialog(
       context: context,
       builder: (context){
       return AlertDialog(
         backgroundColor: Colors.green,
         title: Center(
             child: Text(
                 message,
                 style: TextStyle(color:Colors.white),
             ),
         ),
       );
       },
     );
   }

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
                        'WASP',
                        textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900], fontSize: 20),
                      ),
                    ),
                    Image.asset(
                      'assets/worldd.png',
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
                    Image.asset("assets/man.png", height: 250, width: 250),
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

            //email/username textfield
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
              controller: emailOrUsernameController,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail, color: Colors.green[800]),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade800)
                    ),
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.white,
                    filled: true,
                    hintText: "Username/Email",
                    hintStyle: TextStyle(color: Colors.green[800])),
              ),
              ),
              SizedBox(
                  height: 5
              ),
              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock,color: Colors.green[800]),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade800)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.green[800])),
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
                text: "Login",
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
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                      ),
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