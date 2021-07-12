import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.40,
        alignment: Alignment.center,
        child: Text(
          "CheckOut",
          style: TextStyle(color: Colors.white, fontFamily: "FredokaOne"),
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
