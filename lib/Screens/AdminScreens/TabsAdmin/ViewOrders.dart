import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 2,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.40,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg"),
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
                                    "eslam",
                                    style: TextStyle(
                                      fontFamily: "FredokaOne",
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    "sasasad",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    overflow: TextOverflow.ellipsis,
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
                                      "199 &",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontFamily: "FredokaOne"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Phone  :  ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "MerriweatherSans"),
                                    ),
                                    Text(
                                      "eslam",
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
          ),
        ],
      ),
    );
  }
}
