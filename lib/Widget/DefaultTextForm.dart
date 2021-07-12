import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextForm extends StatelessWidget {
  final IconData perIcon;
  final String hintText;
  final String labelText;
  final Widget sufficon;
  final String valid;
  final TextInputType type;
  final bool show;
  final int number;
  final TextEditingController controller;

  DefaultTextForm({
    @required this.perIcon,
    @required this.hintText,
    @required this.labelText,
    @required this.sufficon,
    @required this.valid,
    @required this.type,
    @required this.show,
    @required this.number,
    @required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
      child: TextFormField(
        controller: controller,
        maxLines: number,
        validator: (value) {
          if (value.isEmpty) {
            return valid;
          }
          return null;
        },
        style: TextStyle(
          fontFamily: "FredokaOne",
        ),
        keyboardType: type,
        obscureText: show,
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.4),
          filled: true,
          prefixIcon: Icon(perIcon, color: Colors.black),
          hintText: hintText,
          labelText: labelText,
          suffixIcon: sufficon,
          labelStyle: TextStyle(
            fontFamily: "PermanentMarker",
            color: Colors.grey,
          ),
          hintStyle: TextStyle(
            fontFamily: "FredokaOne",
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
