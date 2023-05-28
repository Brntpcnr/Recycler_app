import 'package:flutter/material.dart';
import 'package:recycle_app/pages/gift_page.dart';
import 'map.dart';
import 'gift_page.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
              height: 10,
            ),
            Center(
              child: Text("NOTIFICATIONS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800])
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 50,
              child: ButtonTheme(
                minWidth: 0,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
                    ),
                    primary: Colors.green[600], // Set the desired background color
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.recycling),
                      SizedBox(width: 5),
                      Text("You disposed 3kg of waste this week"),
                    ],
                  ),
                  onPressed: () {
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 50,
              child: ButtonTheme(
                minWidth: 0,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
                    ),
                    primary: Colors.green[600], // Set the desired background color
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.map_sharp),
                      SizedBox(width: 5),
                      Text("There are new disposals near you!"),
                    ],
                  ),
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
              height: 20,
            ),
            Container(
              width: 300,
              height: 50,
              child: ButtonTheme(
                minWidth: 0,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
                    ),
                    primary: Colors.yellow[600], // Set the desired background color
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text("You won 40 bonus w-points"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GiftPage()
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset("assets/truck.png", height: 250, width: 250),
            ),
          ],
            ),
        ),
      ),
    );
  }
}
