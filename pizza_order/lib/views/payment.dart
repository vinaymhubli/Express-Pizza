import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_order/constants/colors.dart';
import 'package:pizza_order/models/paymentsucess.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late int value=-1 ;
  late final paymentlable=[
    'Credit card/Debit card',
    'Cash on delivery',
    'UPI',
    'Wallets',
    'Net Banking'
  ];
  late final paymentIcons=[
 FontAwesomeIcons.creditCard,
 FontAwesomeIcons.moneyBills,
 Icons.paypal,
 FontAwesomeIcons.wallet,
 FontAwesomeIcons.bank
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(  
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Payments",style: TextStyle(color: AppColors.AppBarColor,fontWeight: FontWeight.bold,fontSize: 25),),
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },)
      ),
      body: Column(
        
        children: [
          Padding(padding: EdgeInsets.only(top: 8.0)),
          Text("Choose your payment method",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.black38),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          Expanded(child: ListView.separated(
            itemBuilder:  (context, index) {
              return ListTile(
                leading: Radio(value: index, groupValue: value, onChanged: (i)=>setState(()=>i
                  
                )),
                  title: Text(paymentlable[index],
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(paymentIcons[index],color: AppColors.AppBarColor.withOpacity(0.8),),
              );
            },
             separatorBuilder: (context,index){
              return Divider();
             },
              itemCount: paymentlable.length)),
              Center(
                child: InkWell(
                  
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PaymentSucess()));
                },
                child: Container(
                  width: 250,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal:10.0 , vertical:10.0 ),
                  decoration: BoxDecoration(
                    color: AppColors.AppBarColor,
                    borderRadius:BorderRadius.circular(20.0)
                  ),
                  child: Text("Pay Now", style: TextStyle(fontSize: 20.0, color: Colors.white,fontWeight: FontWeight.bold),),
                
                ),
                
                ),
                
                
              ),
              SizedBox(height: 40,)
        ],
      ),
      

    );
  }
}