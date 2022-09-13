import 'package:flutter/material.dart';
import 'package:pizza_order/views/pizza_delivered.dart';
import 'package:pizza_order/views/pizza_home.dart';
class DeliveryRider extends StatefulWidget {
  DeliveryRider({Key? key}) : super(key: key);

  @override
  State<DeliveryRider> createState() => _DeliveryRiderState();
}

class _DeliveryRiderState extends State<DeliveryRider> {
   @override
  void initState() {
    Future.delayed(Duration(seconds: 11),
    (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PizzaDelivered()));
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
      
       Image.asset("assets/images/weare.gif"),
     SizedBox(height: 55,),    
           
           Text("We are on the way....",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),)
    ],
  ),
    );
  }
}