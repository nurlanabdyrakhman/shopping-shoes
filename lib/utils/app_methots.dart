// import 'package:flutter/material.dart';

// import '../data/dammy_data.dart';
// import '../models/shoe_model.dart';





// class AppMethods {
//   AppMethods._();
//   static void addToCart(ShoeModel data, BuildContext context) {
//     bool contains = itemsOnBag.contains(data);

//     if (contains == true) {
//       ScaffoldMessenger.of(context).hideCurrentSnackBar();
//       ScaffoldMessenger.of(context).showSnackBar(failedSnackBar());
//     } else {
//       itemsOnBag.add(data);
//       ScaffoldMessenger.of(context).hideCurrentSnackBar();
//       ScaffoldMessenger.of(context).showSnackBar(successSnackBar());
//     }
//   }

//   static double sumOfItemsOnBag() {
//     double sumPrice = 0.0;
//     for (ShoeModel bagModel in itemsOnBag) {
//       sumPrice = sumPrice + bagModel.price;
//     }
//     return sumPrice;
//   }
// }
