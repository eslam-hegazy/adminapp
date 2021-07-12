import 'package:adminapp/Screens/Home/tabs/Card/CheckButton.dart';
import 'package:adminapp/Screens/Home/tabs/Card/ItemCard.dart';
import 'package:adminapp/Screens/Home/tabs/Card/SuccessfullCheck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CheckOut",
          style: TextStyle(color: Colors.black, fontFamily: "FredokaOne"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ItemCard();
              },
              separatorBuilder: (context, index) => SizedBox(height: 5),
              itemCount: 10,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontFamily: "PermanentMarker", fontSize: 15),
                    ),
                    Text(
                      "\$ 200",
                      style: TextStyle(fontFamily: "FredokaOne", fontSize: 18),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SuccessfullCheck();
                    }));
                  },
                  child: CheckButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
