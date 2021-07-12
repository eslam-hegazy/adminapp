import 'package:adminapp/model/CategoryItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemCategory(CategoryItemModel model) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(model.image),
        ),
        SizedBox(height: 3),
        Text(
          model.title,
          style: TextStyle(
              fontFamily: "FredokaOne", color: Colors.black.withOpacity(0.5)),
        ),
      ],
    ),
  );
}
