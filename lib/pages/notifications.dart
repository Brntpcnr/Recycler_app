import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login.page.dart';
import 'map.dart';

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
              child: ButtonTheme(
                minWidth: 0,
                height: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.recycling),
                      SizedBox(width: 5),
                      Text("You disposed 3kg of waste this week"),
                    ],
                  ),
                  color: Colors.green[600],
                  textColor: Colors.white,
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
              child: ButtonTheme(
                minWidth: 0,
                height: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.map_sharp),
                      SizedBox(width: 5),
                      Text("There are new disposals near you!"),
                    ],
                  ),
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
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: ButtonTheme(
                minWidth: 0,
                height: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text("You won 40 bonus w-points"),
                    ],
                  ),
                  color: Colors.yellow[600],
                  textColor: Colors.white,
                  onPressed: () {
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
