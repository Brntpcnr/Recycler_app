import 'dart:ui';
import 'package:flutter/material.dart';

class GiftPage extends StatefulWidget {
  const GiftPage({Key? key}) : super(key: key);

  @override
  _GiftPageState createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/unnamed.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  child: Text("YOUR GIFTS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800])
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 32,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.yellow,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Text("You have 665 available w-points !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.yellow[600]),)
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.yellow[300],
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.green[800],),
                  Text(
                  'Redeem your w-points into coupons!',
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  primary: Colors.black, // Set the desired text color
                ),
                onPressed: () {
                  // Button action
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      Text('You won 40 bonus w-points'),
                      SizedBox(width: 50),
                      Text("27/05/2023")
                    ],
                  ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black, // Set the desired text color
                ),
                onPressed: () {
                  // Button action
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      Text('You won 30 bonus w-points'),
                      SizedBox(width: 50),
                      Text("25/05/2023")
                    ],
                  ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  primary: Colors.black, // Set the desired text color
                ),
                onPressed: () {
                  // Button action
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      Text('You won 50 bonus w-points'),
                      SizedBox(width: 50),
                      Text("20/05/2023")
                    ],
                  ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black, // Set the desired text color
                ),
                onPressed: () {
                  // Button action
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      Text('You won 80 bonus w-points'),
                      SizedBox(width: 50),
                      Text("19/05/2023")
                    ],
                  ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  primary: Colors.black, // Set the desired text color
                ),
                onPressed: () {
                  // Button action
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      Text('You won 70 bonus w-points'),
                      SizedBox(width: 50),
                      Text("12/05/2023")
                    ],
                  ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black, // Set the desired text color
                ),
                onPressed: () {
                  // Button action
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      Text('You won 20 bonus w-points'),
                      SizedBox(width: 50),
                      Text("09/05/2023")
                    ],
                  ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
