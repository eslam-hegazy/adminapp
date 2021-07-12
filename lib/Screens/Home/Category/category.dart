import 'package:adminapp/Screens/Home/tabs/Home/buildGirdProduct.dart';
import 'package:adminapp/Screens/Home/tabs/Home/itemCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DetailsOrders.dart';
import 'ItemCategory.dart';

class Category extends StatelessWidget {
  List listImages = [
    'https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg',
    'https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg',
    'https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg',
    'https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Name Category",
          style: TextStyle(fontFamily: "FredokaOne", color: Colors.black),
        ),
      ),
      body: GridView.count(
        mainAxisSpacing: 1.0,
        childAspectRatio: 1 / 1.2,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
          listImages.length,
          (index) => InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailsOrders();
              }));
            },
            child: ItemCategory(listImages[index], context),
          ),
        ),
      ),
    );
  }
}
