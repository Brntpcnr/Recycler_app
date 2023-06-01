import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recycle_app/pages/gift_page.dart';
import 'package:recycle_app/pages/notifications.dart';
import 'map.dart';
import 'gift_page.dart';
import 'notifications.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> _deleteAccount(BuildContext context) async {
    try {
      // Delete user account from Firebase Authentication
      await user.delete();

      // Delete user data from Firestore
      await usersCollection.doc(user.uid).delete();

      // Show account deletion success message

    } catch (error) {
      // Show error message if deletion fails
      showDialog(
        context: context,
        builder: (ctx) =>
            AlertDialog(
              title: Text('Account Deleted Successfully'),
              content: Text('Feel free to log in or register!'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
      );
    }
  }

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
            Container(
              width: 160,
              height: 60,
              child: ButtonTheme(
                minWidth: 200,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set the desired border radius
                    ),
                    primary: Colors.green[600], // Set the desired background color
                  ),
                  child: Text("CHECK THE MAP"),
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
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 160,
              height: 60,
              child: ButtonTheme(
                minWidth: 200,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set the desired border radius
                    ),
                    primary: Colors.green[600], // Set the desired background color
                  ),
                  child: Text("DELETE ACCOUNT"),
                  onPressed: () => _deleteAccount(context),
                ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GiftPage()
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Notifications()
                  ),
                );
              },
            ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}
