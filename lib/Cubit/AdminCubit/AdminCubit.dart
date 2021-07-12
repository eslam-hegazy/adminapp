import 'dart:io';

import 'package:adminapp/model/EditModel.dart';
import 'package:adminapp/model/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'AdminState.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(InitialAdminState());
  static AdminCubit get(context) => BlocProvider.of(context);
  String valueChoose;
  List drob = [
    "Winter clothes",
    "Baby clothes",
    "male clothes",
    "Sport clothes",
    "female clothes",
    "summer clothes",
  ];
  List<EditModel> drobList = [
    EditModel(
      "https://image.freepik.com/free-vector/hand-drawn-winter-clothes-essentials_52683-49154.jpg",
      "Winter clothes",
    ),
    EditModel(
      "https://image.freepik.com/free-photo/baby-clothes-white-background-place-text_178193-859.jpg",
      "Baby clothes",
    ),
    EditModel(
      "https://image.freepik.com/free-photo/classic-men-casual-outfits-with-accessories-table_1357-162.jpg",
      "male clothes",
    ),
    EditModel(
      "https://image.freepik.com/free-photo/sports-clothing-kit-sport-running_1303-1733.jpg",
      "Sport clothes",
    ),
    EditModel(
      "https://image.freepik.com/free-photo/rows-hangers-with-clothes_23-2147669916.jpg",
      "female clothes",
    ),
    EditModel(
      "https://image.freepik.com/free-photo/young-mischievous-man-summer-outfit-diving-mask-jumping-with-inflatable-circle-orange-space_197531-15515.jpg",
      "summer clothes",
    ),
  ];
  void changeDrob(value) {
    valueChoose = value;
    emit(ChangeDrob());
  }

  //////// get Image Product
  File productImage;
  final picker1 = ImagePicker();

  Future getProductImage() async {
    final pickedFile = await picker1.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      emit(SuccessfulGetImage());
      uploadProductImage();
      print(pickedFile.path);
    } else {
      emit(ErrorGetImage());
      print('No image selected.');
    }
  }

  ///////////////upload image
  String image = "";
  void uploadProductImage() async {
    emit(LoadingProductImage());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(productImage.path).pathSegments.last}')
        .putFile(productImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SuccessfullProductImage());
        image = value;
        print(image);
      }).catchError((error) {
        emit(ErrorProductImage());
        print(value);
      });
    }).catchError((error) {});
  }
  ///////////////location

  var locationProduct;
  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    locationProduct = "${position.latitude} , ${position.longitude}";
    print(position);
  }

  ////////////////post Product
  ProductModel productModel;
  var dateTime = DateTime.now().toString();
  void postProduct({
    @required String name,
    @required String price,
    @required String description,
    @required String phone,
    @required String type,
  }) {
    emit(LoadingUploadProduct());
    productModel = ProductModel(
      name: name,
      price: price,
      description: description,
      phone: phone,
      photo: image,
      location: locationProduct,
      dataTime: dateTime,
    );
    FirebaseFirestore.instance
        .collection("products")
        .doc(type)
        .set(productModel.toJson())
        .then((value) {
      emit(SuccessfulUploadProduct());
    }).catchError((error) {
      emit(ErrorUploadProduct());
    });
  }

  ///////////////////////get product date
  List<ProductModel> products = [];
  void getProductDate({@required String type}) {
    emit(LoadingGetDateProducts());
    FirebaseFirestore.instance.collection("products").get().then((value) {
      products = [];
      value.docs.forEach((element) {
        products.add(ProductModel.fromJson(element.data()));
      });
      emit(SuccessfulGetDateProducts());
    }).catchError((error) {
      emit(ErrorGetDateProducts());
      print(error.toString());
    });
  }

  //////////////////////Delete Product
  void deleteProduct({@required String dateTime}) {
    FirebaseFirestore.instance
        .collection('products')
        .doc(dateTime)
        .delete()
        .then((value) {
      print("delete Successfully");
    }).catchError((error) {
      print("error");
    });
  }
}
