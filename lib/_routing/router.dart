import 'package:flutter/material.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/views/cart.dart';
import 'package:fruit_store/views/details.dart';
import 'package:fruit_store/views/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => FruitAppHomePage());
    case detailsViewRoute:
      return MaterialPageRoute(
        builder: (context) => FruitAppFruitDetails(fruit: settings.arguments),
      );
    case cartViewRoute:
      return MaterialPageRoute(builder: (context) => FruitAppCartView());
      break;
    default:
      return MaterialPageRoute(builder: (context) => FruitAppHomePage());
  }
}
