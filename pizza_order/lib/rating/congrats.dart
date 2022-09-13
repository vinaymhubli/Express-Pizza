import 'package:flutter/material.dart';
import 'package:pizza_order/views/pizza_home.dart';
class Congrats extends StatefulWidget {
  Congrats({Key? key}) : super(key: key);

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),
    (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PizzaHome()));
    }
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
      
      alignment: Alignment.center,
  child: Column(
    mainAxisAlignment:MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 300,width: 300,
      child: Image.asset("assets/images/vin.gif"),
      
           ),
    ]   
  ),
    ),
    );
    
  }
}