import 'package:adminapp/Cubit/HomeCubit/HomeCubit.dart';
import 'package:adminapp/Cubit/HomeCubit/HomeState.dart';
import 'package:adminapp/Screens/Home/DetailsOrders.dart';
import 'package:adminapp/Screens/Home/Category/category.dart';
import 'package:adminapp/model/CategoryItemModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buildGirdProduct.dart';
import 'itemCategory.dart';

class Home extends StatelessWidget {
  var controllerCarousel = CarouselController();
  List listImages = [
    'https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg',
    'https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg',
    'https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg',
    'https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(3),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      alignment: Alignment.topCenter,
                      child: CarouselSlider.builder(
                        carouselController: controllerCarousel,
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio: 15 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemCount: listImages.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(listImages[itemIndex]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Category",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "FredokaOne",
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return Category();
                              }));
                            },
                            child: itemCategory(cubit.item[index]),
                          );
                        },
                        itemCount: cubit.item.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Hot Orders",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "FredokaOne",
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      color: Colors.yellow,
                      child: GridView.count(
                        mainAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.2,
                        crossAxisSpacing: 12,
                        crossAxisCount: 2,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                          listImages.length,
                          (index) => InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return DetailsOrders();
                              }));
                            },
                            child: buildGirdProduct(listImages[index], context),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
