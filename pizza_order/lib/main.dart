
import 'package:flutter/material.dart';
import 'package:pizza_order/views/lphome.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UI_CHALLENGE_PIZZA_APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(   
        primaryColor: Colors.white,
        accentColor: Colors.white
      ),
    home: LottiePizzaHome(),
    );
  }
}
  