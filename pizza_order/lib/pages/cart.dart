import 'package:flutter/material.dart';
import 'package:pizza_order/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_order/views/payment.dart';
import 'package:pizza_order/views/pizza_cart.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
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
            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Payment()));
              },
              child: Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(28)),
                  alignment: Alignment.center,
                  child: Text(
                    'Order Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            )
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
                    ],
                  ),
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
