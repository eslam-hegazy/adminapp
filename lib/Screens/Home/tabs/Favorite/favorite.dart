import 'package:adminapp/Screens/Home/DetailsOrders.dart';
import 'package:adminapp/Screens/Home/tabs/Favorite/ItemFavorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemFavorite(
            "https://image.freepik.com/free-photo/blithesome-caucasian-woman-with-trendy-makeup-posing-with-smile-indoor-shot-adorable-white-lady-vintage-clothes_197531-11511.jpg",
            "jacket",
            "1888",
            () {},
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: 10,
      ),
    );
  }
}
