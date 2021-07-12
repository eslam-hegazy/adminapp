import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.freepik.com/free-photo/blithesome-caucasian-woman-with-trendy-makeup-posing-with-smile-indoor-shot-adorable-white-lady-vintage-clothes_197531-11511.jpg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "jacket",
                            style: TextStyle(
                              fontFamily: "FredokaOne",
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Price   :   ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "MerriweatherSans"),
                            ),
                            Text(
                              "1888 &",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontFamily: "FredokaOne"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                            ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                child: Text(
                                  "522",
                                  style: TextStyle(fontFamily: "FredokaOne"),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.7),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
