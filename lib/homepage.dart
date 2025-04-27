import 'package:flutter/material.dart';
import 'package:todolist/tasks.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myhomepage();
  }
}

class _myhomepage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("img1.jpg"),
            Text(
              "Task Manager",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            Text(
              "A task manager application facilitates task organization, "
              "prioritization, and deadline tracking, thereby enhancing "
              "time management and overall productivity.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40,left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Tasks();
                    },
                  ));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                    Icon(
                      Icons.arrow_circle_right,
                      color: Colors.white,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
