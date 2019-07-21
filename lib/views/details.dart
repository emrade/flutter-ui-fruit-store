import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/fruit.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/widgets/rating_bar.dart';

class FruitAppFruitDetails extends StatelessWidget {
  final Fruit fruit;
  const FruitAppFruitDetails({Key key, this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: fruit.color),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      fruit.name,
                      style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RatingBar(
                          rating: fruit.rating,
                        ),
                        Text(
                          fruit.rating.toString(),
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontFamily: Fonts.primaryFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        fruit.desc,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontFamily: Fonts.primaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: Icon(
                  LineIcons.long_arrow_left,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: Icon(
                  LineIcons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '$cartViewRoute');
                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 5,
            child: Hero(
              tag: fruit.image,
              child: Image.asset(
                fruit.image,
                fit: BoxFit.cover,
                height: 250.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Text(
                '\$${fruit.price}',
                style: TextStyle(
                  color: Colors.orange,
                  fontFamily: Fonts.primaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: fruit.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                      fontFamily: Fonts.primaryFont,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
