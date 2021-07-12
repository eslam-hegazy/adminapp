import 'package:adminapp/Cubit/AdminCubit/AdminCubit.dart';
import 'package:adminapp/Cubit/AdminCubit/AdminState.dart';
import 'package:adminapp/Widget/AddImage.dart';
import 'package:adminapp/Widget/DefaultButton.dart';
import 'package:adminapp/Widget/DefaultTextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productName = TextEditingController();
    var productPrice = TextEditingController();
    var productDescription = TextEditingController();
    var phoneNumber = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider<AdminCubit>(
      create: (context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {
          if (state is SuccessfulUploadProduct) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = AdminCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              backgroundColor: Colors.yellow,
              title: Text(
                "Add Product",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "PermanentMarker",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Colors.yellow,
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultTextForm(
                        perIcon: null,
                        hintText: "Enter Product Name",
                        labelText: "Product Name",
                        sufficon: null,
                        valid: "Please Enter Product Name",
                        type: TextInputType.text,
                        show: false,
                        number: 1,
                        controller: productName,
                      ),
                      DefaultTextForm(
                        perIcon: null,
                        hintText: "Enter Product Price",
                        labelText: "Product price",
                        sufficon: null,
                        valid: "Please Enter Product price",
                        type: TextInputType.number,
                        show: false,
                        number: 1,
                        controller: productPrice,
                      ),
                      DefaultTextForm(
                        perIcon: null,
                        hintText: "Enter Product Description",
                        labelText: "Product Description",
                        sufficon: null,
                        valid: "Please Enter Product Description",
                        type: TextInputType.text,
                        show: false,
                        number: 3,
                        controller: productDescription,
                      ),
                      DefaultTextForm(
                        perIcon: null,
                        hintText: "Enter Phone Number",
                        labelText: "Phone Number",
                        sufficon: null,
                        valid: "Please Enter Phone Number",
                        type: TextInputType.number,
                        show: false,
                        number: 1,
                        controller: phoneNumber,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, left: 25),
                        child: Container(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black,
                          ),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: DropdownButton(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            underline: SizedBox(),
                            hint: Text(
                              "Choose Your Type",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            value: cubit.valueChoose,
                            dropdownColor: Colors.black.withOpacity(0.5),
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down),
                            onChanged: (value) {
                              cubit.changeDrob(value);
                            },
                            items: cubit.drob.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e.toString()),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            cubit.productImage == null
                                ? AddImage(
                                    Icons.image,
                                    "Image",
                                    Colors.blue,
                                    () {
                                      cubit.getProductImage();
                                    },
                                  )
                                : AddImage(
                                    Icons.done_all_outlined,
                                    "Image",
                                    Colors.grey,
                                    () {
                                      cubit.getProductImage();
                                      Fluttertoast.showToast(
                                          msg: "Add Image Successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    },
                                  ),
                            AddImage(
                              Icons.location_pin,
                              "Location",
                              Colors.red,
                              () {
                                cubit.getCurrentPosition();
                                Fluttertoast.showToast(
                                    msg: "Add Location Successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState.validate()) {
                            if (cubit.image != "" &&
                                cubit.locationProduct != null &&
                                cubit.valueChoose != null) {
                              cubit.postProduct(
                                name: productName.text,
                                price: productPrice.text,
                                description: productDescription.text,
                                phone: phoneNumber.text,
                                type: cubit.valueChoose,
                              );
                              productName.text = null;
                              productPrice.text = null;
                              productDescription.text = null;
                              phoneNumber.text = null;
                              cubit.productImage = null;
                              cubit.locationProduct = null;
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Invalid Image Or Location",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                        },
                        child: state is LoadingUploadProduct
                            ? Center(child: CircularProgressIndicator())
                            : DefaultButton("Add Product", Colors.red),
                      ),
                    ],
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
