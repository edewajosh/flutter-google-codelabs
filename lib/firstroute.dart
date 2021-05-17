import 'package:flutter/material.dart';

class FirstRoute extends StatefulWidget {
  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Route"),
        actions: [],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Open ROute"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
