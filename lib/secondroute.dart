import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.amber, child: Text("Second Route")),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Go back",
            style: TextStyle(
              fontFamily: 'OpenSans'
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
