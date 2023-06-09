import 'package:flutter/material.dart';
import '../components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  //sign user up method
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try{
      //check if the password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Save the additional user details (including username) to Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'username': usernameController.text,
          'email': emailController.text,
        });

      } else{
       //show error message, passwords dont match
        showErrorMessage("Passwords don't match!");
      }

      //pop the loading circle
      //Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
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
                  Text("Register", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]) ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            //username textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: usernameController,
                obscureText: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.green[800]),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade800)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.green[800])),
              ),
            ),

            SizedBox(
                height: 5
            ),

            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: emailController,
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
                    hintText: "Email",
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
                    prefixIcon: Icon(Icons.lock, color: Colors.green[800]),
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

            SizedBox(
                height: 5
            ),

            //confirm password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.green[800]),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade800)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.green[800])),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            MyButton(
              text: "Sign Up",
              onTap: signUserUp,
            ),

            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Log in now',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}