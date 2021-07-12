import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function click;
  AddImage(this.icon, this.text, this.color, this.click);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: click,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                SizedBox(width: 5),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "FredokaOne",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
