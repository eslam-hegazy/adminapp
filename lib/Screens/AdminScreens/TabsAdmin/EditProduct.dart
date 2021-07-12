import 'package:adminapp/Cubit/AdminCubit/AdminCubit.dart';
import 'package:adminapp/Cubit/AdminCubit/AdminState.dart';
import 'package:adminapp/Screens/AdminScreens/DetailsEdit.dart';
import 'package:adminapp/Widget/ItemEdit.dart';

import 'package:adminapp/Widget/ItemMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminCubit>(
      create: (context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AdminCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.yellow,
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              title: Text(
                "Edit Product",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "PermanentMarker",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  addAutomaticKeepAlives: true,
                  mainAxisSpacing: 1.0,
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    cubit.drob.length,
                    (index) => InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailsEdit(cubit.drobList[index].title);
                        }));
                      },
                      child: ItemEdit(cubit.drobList[index].image,
                          cubit.drobList[index].title),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
