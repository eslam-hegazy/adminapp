import 'package:adminapp/Cubit/AdminCubit/AdminCubit.dart';

import 'package:adminapp/model/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final ProductModel model;
  final int index;
  ItemMenu(this.model, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              image: NetworkImage(model.photo),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              model.name,
                              style: TextStyle(
                                fontFamily: "FredokaOne",
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Text(
                              model.description,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Price   :   ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "MerriweatherSans"),
                              ),
                              Text(
                                "${model.price} &",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontFamily: "FredokaOne"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Phone  :  ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "MerriweatherSans"),
                              ),
                              Text(
                                model.phone,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontFamily: "FredokaOne"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.7),
                child: IconButton(
                  onPressed: () {
                    AdminCubit.get(context)
                        .deleteProduct(dateTime: model.dataTime);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
