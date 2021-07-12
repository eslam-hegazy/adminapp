import 'package:adminapp/Cubit/AuthCubit/AuthState.dart';
import 'package:adminapp/Networks/CacheHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());
  static AuthCubit get(context) => BlocProvider.of(context);
  bool show = true;
  IconData icon = Icons.visibility_off;
  void changeShow() {
    icon = show == true ? Icons.visibility : Icons.visibility_off;
    show = !show;
    emit(ChangeVisibility());
  }

  ////////register
  bool admin = false;
  void changeAdmin() {
    admin = !admin;
    print(admin);
    emit(ChangeAdmin());
  }

  void register({@required String email, @required String password}) {
    emit(LoadingRegister());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SuccessfulRegister(value.user.uid));
      print(value.user.uid);
    }).catchError((error) {
      print(error);
      emit(ErrorRegister(error.message.toString()));
    });
  }

  ///////////////login
  void login({@required String email, @required String password}) {
    emit(LoadingLogin());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.setDate(key: "token", value: value.user.uid).then((v) {
        emit(SuccessfulLogin(value.user.uid));
      }).catchError((error) {
        print(error.message.toString());
      });
      print(value.user.uid);
    }).catchError((error) {
      print(error.message.toString());
      emit(ErrorLogin(error.message.toString()));
    });
  }
}
