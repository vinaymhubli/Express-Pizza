import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart'; 
import 'package:pizza_order/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_order/models/menuitme.dart';
import 'package:pizza_order/models/menumodels.dart';
import 'package:pizza_order/pages/cart.dart';
import 'package:pizza_order/pages/profile.dart';
import 'package:pizza_order/views/favourites.dart';
import 'package:pizza_order/views/mainpage.dart';
import 'package:pizza_order/views/non_veg_pizza.dart';
import 'package:pizza_order/views/pizza_cart.dart';
import 'package:pizza_order/rating/start_rating.dart';
import 'package:pizza_order/views/veg_pizza.dart';


class PizzaHome extends StatefulWidget {
  PizzaHome({Key? key}) : super(key: key);

  @override
  State<PizzaHome> createState() => _PizzaHomeState();
}

class _PizzaHomeState extends State<PizzaHome> {
  final List<Widget> _tabItems = [MainPage(), Cart(), Profile()];
int _activePage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: AppColors.AppBarColor,
        centerTitle: true,
        title: Text("Pizza Express", style: TextStyle(color: AppColors.PrimaryTextColor,
        fontSize: 30,fontWeight: FontWeight.bold),),
        elevation: 0.0,
        actions: [
        PopupMenuButton<Menumodels>(onSelected: (item)=>onSelected(context,item),
          itemBuilder: (context)=>[...MenuItems.items.map(buildItem).toList()])
        ],
      ),
      body: _tabItems[_activePage],
      bottomNavigationBar: CurvedNavigationBar(   
        color: Colors.white24,
        backgroundColor: AppColors.AppBarColor,
        buttonBackgroundColor: Colors.black,
        height: 55.0,
        items: [
          Icon(Icons.home,color: Colors.white),
         
            Icon(Icons.shopping_cart_sharp,color: Colors.white),

          Icon(Icons.location_history_sharp,color: Colors.white),

        ],
       onTap: (index) {
   setState(() {
     _activePage = index;
   });
 },
        animationCurve: Curves.easeInOutExpo,
       animationDuration: Duration(milliseconds: 550),
      ),
    );
  }

  
  PopupMenuItem<Menumodels>buildItem(Menumodels item)=>PopupMenuItem<Menumodels>(value: item,
    child: Row(
    children: [
      Icon(item.icon,color: Colors.black,size: 20),
      SizedBox(width: 11),
      Text(item.text),
    ],
  ));

  void onSelected(BuildContext context,Menumodels item){
    switch (item) {
      case MenuItems.itemshare:Navigator.push(context, MaterialPageRoute(builder: (context)=>StartRating()));
        
        break;
      default:
    }
  }
}

 
  


  