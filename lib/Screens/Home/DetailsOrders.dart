import 'package:adminapp/Widget/DefaultButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10,
                              child: Text(
                                "20",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.26,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "name product",
                    style: TextStyle(
                      fontFamily: "FredokaOne",
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "ecommerce website design examples from top ... and accessories the largest single product category in the ecommerce industry. ... integrations and apps, is an excellent fit for fast-growth businesses ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Price : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "PermanentMarker"),
                          ),
                          Text(
                            "15545 &",
                            style: TextStyle(
                                color: Colors.blue, fontFamily: "FredokaOne"),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Quantity :      ",
                          style: TextStyle(
                            fontFamily: "MerriweatherSans",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "5",
                              style: TextStyle(fontFamily: "FredokaOne"),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.8),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: DefaultButton("Add To Card", Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
