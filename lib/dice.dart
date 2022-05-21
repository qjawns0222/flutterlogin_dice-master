import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftdice = 2;
  int rightdice = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text(
          'Dice Game',
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 1.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset('image/dice$leftdice.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Image.asset('image/dice$rightdice.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    leftdice = Random().nextInt(6) + 1;
                    rightdice = Random().nextInt(6) + 1;
                  });
                  showToast("Left Dice:{$leftdice}, Right Dice:{$rightdice}");
                },
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50.0,
                ),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {

  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.black
  );
}
