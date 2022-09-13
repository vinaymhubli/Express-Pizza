import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_order/constants/colors.dart';
import 'package:pizza_order/views/delivery.dart';
class PaymentSucess extends StatefulWidget {
  PaymentSucess({Key? key}) : super(key: key);

  @override
  State<PaymentSucess> createState() => _PaymentSucessState();
}

class _PaymentSucessState extends State<PaymentSucess> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),
    (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DeliveryHome()));
    }
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
color: AppColors.AppBarColor.withOpacity(0.9),
      alignment: Alignment.center,
  child: Column(
    mainAxisAlignment:MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 600,width: 800,
      child: Lottie.asset("assets/images/sucessful.json")
           )
    ],
  ),
    );
  }
}