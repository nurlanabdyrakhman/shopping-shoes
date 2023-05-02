import 'package:flutter/material.dart';
import 'package:shoping_hotic/data/dammy_data.dart';

import '../components/custom_snackbars.dart';
import '../models/shoe_model.dart';







class AppMethods {
  AppMethods._();
  static void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBars.failedSnackBar(),);
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBars.successSnackBar(),);
    }
  }

  static double allTheItemsOnBag() {
    double sumPrice = 0.0;
    for (ShoeModel item in itemsOnBag) {
      sumPrice = sumPrice + item.price;
    }
    return sumPrice;
  }
}
