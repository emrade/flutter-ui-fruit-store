import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/fruit.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/widgets/fruits.dart';

class FruitAppHomePage extends StatefulWidget {
  @override
  _FruitAppHomePageState createState() => _FruitAppHomePageState();
}

class _FruitAppHomePageState extends State<FruitAppHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Color(0XFF558948),
          unselectedItemColor: Colors.grey.withOpacity(0.6),
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.thLarge),
              title: Text(
                'Platter',
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.user),
              title: Text(
                'My',
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            )
          ]),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                // icon: Icon(FontAwesomeIcons.thLarge),
                icon: Icon(LineIcons.shield),
                onPressed: () {},
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15.0),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              IconButton(
                // icon: Icon(FontAwesomeIcons.thLarge),
                icon: Icon(LineIcons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '$cartViewRoute');
                },
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Texts.header,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: TabText.tabText1,
                ),
                Tab(
                  child: TabText.tabText2,
                ),
                Tab(
                  child: TabText.tabText3,
                ),
                Tab(
                  child: TabText.tabText4,
                ),
              ],
            ),
          ),
          Container(
            height: 330.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new FruitsWidget(),
                new FruitsWidget(),
                new FruitsWidget(),
                new FruitsWidget(),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Texts.subHeader,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: fruits.reversed
                  .map((fruit) => _buildFruitCard(fruit))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFruitCard(Fruit fruit) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 125,
            width: 125,
          ),
          Positioned(
            left: 15.0,
            child: Container(
              height: 20.0,
              width: 25.0,
              decoration: BoxDecoration(
                color: Color(0XFFD2691F),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
          ),
          Positioned(
            top: 7.0,
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '$detailsViewRoute',
                    arguments: fruit,
                  );
                },
                child: Container(
                  height: 110.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    color: Color(0XFFABC4A5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Image.asset(
                        fruit.image,
                        fit: BoxFit.cover,
                        height: 70.0,
                      ),
                      Text(
                        '\$' + fruit.price,
                        style: TextStyle(
                          fontFamily: Fonts.primaryFont,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 15.0,
            child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                color: Color(0XFFFE9741),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(3.0),
                  bottomRight: Radius.circular(3.0),
                  topLeft: Radius.circular(3.0),
                ),
              ),
              child: Center(
                child: Text(
                  fruit.discount + '%',
                  style: TextStyle(
                    fontFamily: Fonts.primaryFont,
                    fontSize: 9.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
