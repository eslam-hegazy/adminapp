import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemProfile extends StatelessWidget {
  final String text;

  ItemProfile(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.only(right: 25, left: 25, top: 25, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontFamily: "FredokaOne", fontSize: 15),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
