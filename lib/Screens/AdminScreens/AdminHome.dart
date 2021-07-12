import 'package:adminapp/Cubit/AdminCubit/AdminCubit.dart';
import 'package:adminapp/Cubit/AdminCubit/AdminState.dart';
import 'package:adminapp/Screens/AdminScreens/TabsAdmin/EditProduct.dart';
import 'package:adminapp/Screens/AdminScreens/TabsAdmin/ViewOrders.dart';
import 'package:adminapp/Screens/AdminScreens/TabsAdmin/addproduct.dart';
import 'package:adminapp/Screens/Login/Login.dart';
import 'package:adminapp/Widget/AdminButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminCubit>(
      create: (context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.yellow,
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Login();
                    }));
                  },
                  child: Row(
                    children: [
                      Text(
                        "LogOut",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "FredokaOne"),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return AddProduct();
                      }));
                    },
                    child: AdminButton(Colors.red, "Add Product"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return EditProduct();
                      }));
                    },
                    child: AdminButton(Colors.blue, "Edit Product"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ViewOrders();
                      }));
                    },
                    child: AdminButton(Colors.green, "View Orders"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
