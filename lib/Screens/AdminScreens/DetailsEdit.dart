import 'package:adminapp/Cubit/AdminCubit/AdminCubit.dart';
import 'package:adminapp/Cubit/AdminCubit/AdminState.dart';
import 'package:adminapp/Widget/ItemMenu.dart';
import 'package:adminapp/model/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsEdit extends StatelessWidget {
  final String text;

  DetailsEdit(this.text);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCubit()..getProductDate(type: text),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = AdminCubit.get(context).products;
          return Scaffold(
            appBar: AppBar(),
            body: ListView.separated(
              itemBuilder: (context, index) {
                return ItemMenu(model[index], index);
              },
              separatorBuilder: (context, index) => SizedBox(),
              itemCount: model.length,
            ),
          );
        },
      ),
    );
  }
}
