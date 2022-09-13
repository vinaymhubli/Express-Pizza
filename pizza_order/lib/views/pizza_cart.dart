

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_order/constants/colors.dart';
import 'package:pizza_order/views/payment.dart';

class PizzaCart extends StatefulWidget {
  PizzaCart({Key? key}) : super(key: key);

  @override
  State<PizzaCart> createState() => _PizzaCartState();
}

class _PizzaCartState extends State<PizzaCart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.appbarBackgroundcolor,
      appBar: AppBar(
        backgroundColor: AppColors.AppBarColor,
        centerTitle: true,
        title: Text("Pizza Express", style: TextStyle(color: AppColors.PrimaryTextColor,
        fontSize: 30,fontWeight: FontWeight.bold),),
        elevation: 0.0,
      
        leading: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){Navigator.pop(context);}, ),
        
      ),
      body: SafeArea(child: Container(   
        color: AppColors.pizzaCartBackgroundColor,
        height: double.infinity,
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cart_method(),
              Padding(
                padding: const EdgeInsets.only(bottom:4.0,left: 110.0),
                child: Text("Selected quantity",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
              ),
              SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              size_quantity(title: 'Small', size: '₹299..', color: Colors.black, icons: FontAwesomeIcons.pizzaSlice, iconcolor: Colors.black),
              size_quantity(title: 'Medium', size: '₹599..', color: Colors.black, icons: FontAwesomeIcons.pizzaSlice, iconcolor: Colors.black),
              size_quantity(title: 'Full', size: '₹799..', color: Colors.black, icons: FontAwesomeIcons.pizzaSlice, iconcolor: Colors.black),
               
            ],
           ),
           SizedBox(height: 40,),
           Center(
             child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Payment()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:20.0 , vertical:10.0 ),
                decoration: BoxDecoration(
                  color: AppColors.AppBarColor,
                  borderRadius:BorderRadius.circular(20.0)
                ),
                child: Text("Place Order", style: TextStyle(fontSize: 23.0, color: Colors.white,fontWeight: FontWeight.bold),),
              ),
             ),
           )
           
            ],
          ),
        ),
      )
      ),
       
      ),
    );
  }

}

class size_quantity extends StatelessWidget {
late  final String title;
late  final String size;
late  final IconData icons;
late final Color color;
late final Color iconcolor;
size_quantity({required this.title, required this.size, required this.icons,required this.color,required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height:100.0,
          width: 90.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 126, 126),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 7.0)),
                Icon(icons,color: iconcolor,size: 40,),
                SizedBox(height: 10.0,),
                Text(title,style: TextStyle(color: color),),
                SizedBox(height: 2.0,),
                Text(size,style: TextStyle(color: color),)

              ],
            ),
          ),
        )
      ],
    );
  }
}
  class cart_method extends StatelessWidget {
    cart_method({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: AppColors.AppBarColor,
                  height: 120.0,

                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  height: 300.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image(image: AssetImage("assets/images/cv.jpg"),width: 420.0,),
                      ),
                      Padding(padding: EdgeInsets.only(top: 7.5),
                      child: Center(
                        child: Text("pepperoni",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                      ),
                      
                      Row(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       
                        Icon(Icons.arrow_back_ios,color: Colors.grey),
                        Icon(Icons.arrow_forward_ios,color: Colors.grey),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0,right: 22.0),
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.minusCircle,color: AppColors.AppBarColor,size: 38.0,),
                            SizedBox(width: 38.0,),
                            Icon(FontAwesomeIcons.plusCircle,color: Color.fromARGB(255, 24, 156, 17),size: 38.0,),
                            

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                
              ],
            )
          ],
      );
    }
    
  }

 