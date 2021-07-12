import 'package:flutter/material.dart';

class ItemFavorite extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Function onClick1;

  ItemFavorite(
    this.image,
    this.title,
    this.price,
    this.onClick1,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.centerLeft,
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
                            image: NetworkImage(image),
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
                            title,
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
                              "\$ $price",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontFamily: "FredokaOne"),
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
                  onPressed: onClick1,
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
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
