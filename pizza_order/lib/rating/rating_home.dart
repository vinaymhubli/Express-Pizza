import 'package:flutter/material.dart';
import 'package:pizza_order/rating/rating_dialog.dart';

class RatingHome extends StatefulWidget {
  RatingHome({Key? key}) : super(key: key);

  @override
  State<RatingHome> createState() => _RatingHomeState();
}

class _RatingHomeState extends State<RatingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          
          children: [
          Image.asset('assets/images/star.gif'),
            
            Spacer(),
           TextButton.icon(onPressed: (){
            openrating(context);
           },
           style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 230, 112, 48).withOpacity(0.8))),
            icon: Icon(Icons.touch_app_rounded,size: 38,),
             label: Text("Rate-Us",style: Theme.of(context).textTheme.headline6,))
          ],
        ),
      )),
    );
  }

  openrating(BuildContext context){
    showDialog(context: context, builder: (context){
      return Dialog(
        child: DialogBox(),
      );
    });
  }
}