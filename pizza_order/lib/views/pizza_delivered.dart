import 'package:flutter/material.dart';
import 'package:pizza_order/views/pizza_home.dart';
class PizzaDelivered extends StatefulWidget {
  PizzaDelivered({Key? key}) : super(key: key);

  @override
  State<PizzaDelivered> createState() => _PizzaDeliveredState();
}

class _PizzaDeliveredState extends State<PizzaDelivered> {
   @override
  void initState() {
    Future.delayed(Duration(seconds: 3),
    (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PizzaHome()));
    }
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
      alignment: Alignment.center,
  child: Column(
    mainAxisAlignment:MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      
       Image.asset("assets/images/delivered.gif"),
     SizedBox(height: 55,),    
           
           Text("",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),)
    ],
  ),
    );
  }
}