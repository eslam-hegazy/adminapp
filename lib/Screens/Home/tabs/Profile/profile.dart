import 'package:adminapp/Networks/CacheHelper.dart';
import 'package:adminapp/Screens/Home/tabs/Profile/ItemProfile.dart';
import 'package:adminapp/Screens/Login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.29,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(500),
                        bottomRight: Radius.circular(100),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://image.freepik.com/free-photo/3d-illustration-smartphone-with-products-coming-out-screen-online-shopping-e-commerce-concept_58466-14529.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                          "https://image.freepik.com/free-photo/front-view-young-male-holding-yellow-background_140725-103827.jpg"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Eslam Ali",
                style: TextStyle(fontFamily: "FredokaOne", fontSize: 18),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            InkWell(
              onTap: () {},
              child: ItemProfile("Personal Info "),
            ),
            InkWell(
              onTap: () {},
              child: ItemProfile("Order History "),
            ),
            InkWell(
              onTap: () {},
              child: ItemProfile("Shopping Address "),
            ),
            InkWell(
              onTap: () {
                CacheHelper.deleteDate(key: "token").then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                    return Login();
                  }));
                });
              },
              child: ItemProfile("LogOut"),
            ),
          ],
        ),
      ),
    );
  }
}
