import 'package:demoapp/pages/Wallet/payment_methods.dart';
import 'package:demoapp/pages/Wallet/withdraw_history.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "Wallet",
          style: TextStyle(color:Colors.black),
        ),
        leading: IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()))
                                        },
                  ) ,
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/credit-card-with-dollar-coin-users-e-commerce-online-shopping-financial-operations-plastic-card-mobile-payment-banking-concept-vector-isolated-illustr.png')),
              Text('My Wallet', style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Add your address or add new one. This need for delivery product', textAlign: TextAlign.center, ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: DottedBorder(
                  radius: Radius.circular(5),
                          borderType: BorderType.RRect,
                  child: ListTile(leading: Image.asset('assets/images/745133.png',),
                  title: Text('Withdraw History'),
                  trailing: Image.asset('assets/images/arrow left.png'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Withdraw()));
                  },),
                ),
              ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: DottedBorder(
                  radius: Radius.circular(5),
                          borderType: BorderType.RRect,
                  child: ListTile(leading: Image.asset('assets/images/ic_bank.png',),
                  title: Text('Add Payment Methods'),
                  trailing: Image.asset('assets/images/arrow left.png'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Paymentmethod()));
                  },),
                ),
              ),
          ],
        )
      ),
    );
  }
}
