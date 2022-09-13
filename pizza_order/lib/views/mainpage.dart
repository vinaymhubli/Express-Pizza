import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_order/constants/colors.dart';
import 'package:pizza_order/views/favourites.dart';
import 'package:pizza_order/views/non_veg_pizza.dart';
import 'package:pizza_order/views/pizza_cart.dart';
import 'package:pizza_order/views/veg_pizza.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: AppColors.PrimaryBodyColor,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              color: AppColors.AppBarColor,
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: AppColors.PrimaryunselectedColor,
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: AppColors.AppBarColor,
                ),
                tabs: [
                  Tab(text: "Items"),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VegPizza()));
                      },
                      child: Tab(text: "Veg Pizza")),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NonVegPizza()));
                      },
                      child: Tab(text: "Non-Veg Pizza")),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Favourites()));
                      },
                      child: Tab(text: "Favourites-")),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/vinay.gif",
                    height: 50,
                  )
                ],
              ),
            ),
            pizza_card(
                img: "assets/images/img3.png",
                title: 'Veg Extravaganza',
                size: 'Medium',
                price: '455'),
            pizza_card(
                img: "assets/images/pizza.jpg",
                title: 'Deluxe Veggie',
                size: 'Large',
                price: '799'),
            pizza_card(
                img: "assets/images/pizza3.png",
                title: 'CHEESE N CORN',
                size: 'Large',
                price: '699'),
            pizza_card(
                img: "assets/images/cv.jpg",
                title: 'pepperoni',
                size: 'Medium',
                price: '599'),
            pizza_card(
                img: "assets/images/img12.jpg",
                title: 'Cheese Margherita',
                size: 'Medium',
                price: '616'),
            pizza_card(
                img: "assets/images/img13.jpg",
                title: 'Peppy Paneer',
                size: 'Large',
                price: '516'),
            pizza_card(
                img: "assets/images/vp.png",
                title: 'Chicken Mexicana',
                size: 'Medium',
                price: '989'),
            pizza_card(
                img: "assets/images/xv.jpg",
                title: 'Greek Pzza',
                size: 'Large',
                price: '555'),
          ],
        ),
      ),
    ));
  }
}

class pizza_card extends StatelessWidget {
  pizza_card(
      {required this.img,
      required this.title,
      required this.size,
      required this.price});

  final String img;
  final String title;
  final String size;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => PizzaCart())),
          child: Container(
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            height: 170.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(160, 10, 10, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.heart,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    size,
                    style: TextStyle(color: Colors.black26),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 75,
                        child: Text(
                          price,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(28)),
                        alignment: Alignment.center,
                        child: Text(
                          "Order now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          bottom: 15.0,
          top: 5.0,
          child: ClipRRect(
            child: Image(
              width: 150,
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
