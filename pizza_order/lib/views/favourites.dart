import 'package:flutter/material.dart';
import 'package:pizza_order/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_order/models/menuitme.dart';
import 'package:pizza_order/models/menumodels.dart';
import 'package:pizza_order/views/non_veg_pizza.dart';
import 'package:pizza_order/views/pizza_cart.dart';
import 'package:pizza_order/rating/start_rating.dart';
import 'package:pizza_order/views/pizza_home.dart';
import 'package:pizza_order/views/veg_pizza.dart';

class Favourites extends StatefulWidget {
  Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.AppBarColor,
        centerTitle: true,
        title: Text(
          "Pizza Express",
          style: TextStyle(
              color: AppColors.PrimaryTextColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          PopupMenuButton<Menumodels>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) =>
                  [...MenuItems.items.map(buildItem).toList()])
        ],
      ),
      body: SafeArea(
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
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PizzaHome()));
                        },
                        child: Tab(text: "Items")),
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
                    Tab(text: "Favourites-"),
                  ],
                ),
              ),
              pizza_card(
                  img: "assets/images/marg.png",
                  title: 'Margherita',
                  size: 'Medium',
                  price: '455'),
              pizza_card(
                  img: "assets/images/farmhouse.png",
                  title: 'Farm House',
                  size: 'Large',
                  price: '799'),
            ],
          ),
        ),
      )),
    );
  }

  PopupMenuItem<Menumodels> buildItem(Menumodels item) =>
      PopupMenuItem<Menumodels>(
          value: item,
          child: Row(
            children: [
              Icon(item.icon, color: Colors.black, size: 20),
              SizedBox(width: 11),
              Text(item.text),
            ],
          ));

  void onSelected(BuildContext context, Menumodels item) {
    switch (item) {
      case MenuItems.itemshare:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StartRating()));

        break;
      default:
    }
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
                      Container(decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,

                      ),
                        child: Icon(
                          
                          FontAwesomeIcons.heart,color: Colors.white
                        ),
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
