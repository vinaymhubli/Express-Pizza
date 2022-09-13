import 'package:flutter/material.dart';
import 'package:pizza_order/views/pizza_home.dart';
import 'package:lottie/lottie.dart';
class LottiePizzaHome extends StatefulWidget {
  LottiePizzaHome({Key? key}) : super(key: key);

  @override
  State<LottiePizzaHome> createState() => _LottiePizzaHomeState();
}

class _LottiePizzaHomeState extends State<LottiePizzaHome> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 11),
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
  alignment: Alignment.center,
  child: Column(
    mainAxisAlignment:MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 300,width: 300,
      child: Lottie.asset("assets/images/pressloader.json"),
      
           ),
           Padding(
             padding: const EdgeInsets.only(top: 95.0),
             child: Text("Developed By Vinay",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 17,decoration: TextDecoration.none ,fontStyle: FontStyle.italic  )),
           ),
    ],
  ),
    );
    
  }
}