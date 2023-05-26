import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'map.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/unnamed.png"),
              ),
            ),
            SizedBox(
                height: 25
            ),
            Text(
                user.email!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            ButtonTheme(
              minWidth: 200,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text("CHECK THE MAP"),
                color: Colors.green[600],
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Maps()
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
        color: Colors.green[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.card_giftcard),
              onPressed: () {
                // Perform action when home button is pressed
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Perform action when settings button is pressed
              },
            ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}
