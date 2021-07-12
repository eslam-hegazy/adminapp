import 'package:adminapp/Cubit/HomeCubit/HomeCubit.dart';
import 'package:adminapp/Cubit/HomeCubit/HomeState.dart';
import 'package:adminapp/Networks/CacheHelper.dart';
import 'package:adminapp/Screens/Home/tabs/Card/Card.dart';
import 'package:adminapp/Screens/Login/Login.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: FancyBottomNavigation(
              barBackgroundColor: Colors.yellow,
              circleColor: Colors.red,
              textColor: Colors.black,
              initialSelection: HomeCubit.get(context).index,
              tabs: [
                TabData(iconData: Icons.home, title: "Home"),
                TabData(
                    iconData: Icons.favorite_outline_rounded,
                    title: "Favorite"),
                TabData(iconData: Icons.person, title: "Person"),
              ],
              inactiveIconColor: Colors.red,
              onTabChangedListener: (position) {
                HomeCubit.get(context).changebottomNavigation(position);
              },
            ),
            appBar: AppBar(
              elevation: 0,
              title: Text(
                HomeCubit.get(context).title[HomeCubit.get(context).index],
                style: TextStyle(color: Colors.black, fontFamily: "FredokaOne"),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return card();
                          }));
                        },
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
            body: HomeCubit.get(context).screens[HomeCubit.get(context).index],
          );
        },
      ),
    );
  }
}
