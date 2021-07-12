import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminButton extends StatelessWidget {
  final Color color;
  final String text;

  AdminButton(this.color, this.text);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontFamily: "FredokaOne", fontSize: 18),
        ),
      ),
    );
  }
}
