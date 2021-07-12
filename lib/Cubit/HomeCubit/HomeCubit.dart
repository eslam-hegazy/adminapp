import 'package:adminapp/Cubit/HomeCubit/HomeState.dart';
import 'package:adminapp/Screens/Home/tabs/Favorite/favorite.dart';
import 'package:adminapp/Screens/Home/tabs/Home/home.dart';
import 'package:adminapp/Screens/Home/tabs/Card/Card.dart';
import 'package:adminapp/Screens/Home/tabs/Profile/profile.dart';
import 'package:adminapp/model/CategoryItemModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    Home(),
    Favorite(),
    Profile(),
  ];
  List title = [
    "Home",
    "Favorite",
    "Profile",
  ];
  int index = 0;
  void changebottomNavigation(int value) {
    index = value;
    emit(ChangebottomNavigation());
  }

  List<CategoryItemModel> item = [
    CategoryItemModel(
        "https://image.flaticon.com/icons/png/512/4497/4497910.png",
        "Winter clothes"),
    CategoryItemModel(
        "https://image.flaticon.com/icons/png/256/4861/4861713.png",
        "Baby clothes"),
    CategoryItemModel(
        "https://image.flaticon.com/icons/png/128/2331/2331716.png",
        "male clothes"),
    CategoryItemModel(
        "https://image.flaticon.com/icons/png/256/4669/4669603.png",
        "Sport clothes"),
    CategoryItemModel(
        "https://image.flaticon.com/icons/png/512/3893/3893209.png",
        "female clothes"),
    CategoryItemModel(
        "https://image.flaticon.com/icons/png/256/4433/4433229.png",
        "summer clothes"),
  ];
}
