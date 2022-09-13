import 'package:flutter/material.dart';
import 'package:pizza_order/views/delivery_rider.dart';

class DeliveryHome extends StatefulWidget {
  DeliveryHome({Key? key}) : super(key: key);

  @override
  State<DeliveryHome> createState() => _DeliveryHomeState();
}

class _DeliveryHomeState extends State<DeliveryHome> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 9),
    (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DeliveryRider()));
    }
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
  child: Column(
    mainAxisAlignment:MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      
       Image.asset("assets/images/ready.gif"),
      
           
           Text("Your Pizza is getting ready",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),)
    ],
  ),
    );
  }
}