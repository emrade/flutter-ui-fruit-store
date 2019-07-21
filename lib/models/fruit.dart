import 'package:flutter/material.dart';
import 'package:fruit_store/utils/utils.dart';

class Fruit {
  int id;
  String name,
      desc =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra, luctus nisi ac, semper enim. Vestibulum in mi feugiat, mattis erat suscipit, fermentum quam. Mauris non urna sed odio congue rhoncus.',
      price,
      image,
      discount;
  Color color;
  double rating;

  Fruit(this.id, this.name, this.price, this.image, this.discount, this.color,
      this.rating);
}

final List<Fruit> fruits = [
  Fruit(
      1,
      'Big single avocado fresh imported fruit from the mexican avocado collection',
      '18.78',
      ImageAssetPath.avocadoImage,
      '89',
      Color(0XFF558948),
      4.5),
  Fruit(
      2,
      'Grape seedlings of horse milk grape seelings of xinjiang white milk south',
      '65.36',
      ImageAssetPath.grapeImage,
      '12',
      Color(0XFF8FC320),
      4.9),
  Fruit(
      3,
      'Imported egyptian navel orange fresh fruit of the season fresh orange',
      '12.88',
      ImageAssetPath.orangeImage,
      '75',
      Color(0XFFef9b13),
      5.0),
  Fruit(4, 'Special apple fresh from the southern califonia farm in texas USA',
      '13.88', ImageAssetPath.appleImage, '80', Color(0XFFef794f), 4.4),
  Fruit(
      5,
      'Beautiful lemon harvested for a wonderful lemon tree in a farm somewhere',
      '15.00',
      ImageAssetPath.lemonImage,
      '75',
      Color(0XFFead04d),
      5.0),
];
