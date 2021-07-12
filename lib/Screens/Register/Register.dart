import 'package:adminapp/Cubit/AuthCubit/AuthCubit.dart';
import 'package:adminapp/Cubit/AuthCubit/AuthState.dart';
import 'package:adminapp/Networks/CacheHelper.dart';
import 'package:adminapp/Screens/AdminScreens/AdminHome.dart';
import 'package:adminapp/Screens/Home/HomeScreen.dart';
import 'package:adminapp/Screens/Login/Login.dart';
import 'package:adminapp/Widget/DefaultButton.dart';
import 'package:adminapp/Widget/DefaultTextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class Register extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String password = "admin968";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ErrorRegister) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (state is SuccessfulRegister) {
            if (passwordController.text == password) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return AdminHome();
              }));
            } else {
              CacheHelper.setDate(key: "token", value: state.token)
                  .then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) {
                  return HomeScreen();
                }));
              }).catchError((error) {
                print(error.toString());
              });
            }
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.yellow,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(200),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.09,
                          bottom: 10,
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.14,
                              child: Lottie.asset(
                                  'images/53616-shopping-list.json'),
                            ),
                            Text(
                              "Shopping",
                              style: TextStyle(
                                  fontFamily: "PermanentMarker",
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.white.withOpacity(0.9),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(200),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 4),
                      child: Text(
                        "Register !",
                        style: TextStyle(
                            fontFamily: "FredokaOne",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 4),
                      child: Text(
                        "Create Account to shop Your Products !",
                        style: TextStyle(
                          fontFamily: "PermanentMarker",
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    DefaultTextForm(
                      perIcon: Icons.person,
                      hintText: "user name",
                      labelText: "name",
                      sufficon: null,
                      valid: "Please Enter Your Name",
                      type: TextInputType.emailAddress,
                      show: false,
                      number: 1,
                      controller: nameController,
                    ),
                    DefaultTextForm(
                      perIcon: Icons.email,
                      hintText: "email address",
                      labelText: "email",
                      sufficon: null,
                      valid: "Please Enter Your Email",
                      type: TextInputType.emailAddress,
                      show: false,
                      number: 1,
                      controller: emailController,
                    ),
                    DefaultTextForm(
                      perIcon: Icons.lock,
                      hintText: "your password",
                      labelText: "passowrd",
                      sufficon: IconButton(
                        onPressed: () {
                          cubit.changeShow();
                        },
                        icon: Icon(cubit.icon),
                      ),
                      valid: "Please Enter Your Password",
                      type: TextInputType.emailAddress,
                      show: cubit.show,
                      number: 1,
                      controller: passwordController,
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState.validate()) {
                          cubit.register(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: state is LoadingRegister
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : DefaultButton("Register !", Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have An Account ? ",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: "MerriweatherSans"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) {
                              return Login();
                            }));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: "FredokaOne",
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
