import 'package:flutter/material.dart';
import 'package:pizza_order/rating/rating_home.dart';
class StartRating extends StatelessWidget {
  const StartRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(  
        primarySwatch: Colors.red,
        dialogTheme: DialogTheme(   
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),
      home: RatingHome(),
    );
    
  }
}