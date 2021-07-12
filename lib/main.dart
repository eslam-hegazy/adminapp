import 'package:adminapp/Cubit/AuthCubit/AuthCubit.dart';
import 'package:adminapp/Networks/CacheHelper.dart';
import 'package:adminapp/Screens/AdminScreens/AdminHome.dart';
import 'package:adminapp/Screens/Home/HomeScreen.dart';
import 'package:adminapp/Screens/Login/Login.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helper/MyBlocObserver.dart';

var token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  Widget widget;
  await CacheHelper.init();
  token = CacheHelper.getDate(key: "token");
  if (token == null) {
    widget = Login();
  } else {
    widget = HomeScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget widget;

  MyApp(this.widget);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.yellow,
        appBarTheme: AppBarTheme(
          color: Colors.yellow,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 2,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
        ],
        child: widget,
      ),
    );
  }
}
