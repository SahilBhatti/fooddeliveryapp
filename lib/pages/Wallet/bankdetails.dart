import 'package:demoapp/pages/Wallet/payment_methods.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';



class Bankdetails extends StatelessWidget {
  const Bankdetails({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: BankdetailsScreen(title: appTitle),
    );
  }
}

class BankdetailsScreen extends StatefulWidget {
  const BankdetailsScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BankdetailsScreen> createState() => _BankdetailsScreenState();
}

class _BankdetailsScreenState extends State<BankdetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(title: Text('', style: TextStyle(color:Colors.black, fontSize: 15),),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading:IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Paymentmethod()))
                    },
                  ) ,
      elevation: 0,
      actions: [
            Builder(
              builder: (context) => IconButton(
                    icon:Image.asset('assets/images/Group 15214.png'),
                    onPressed: () => SlideDrawer.of(context)?.toggle(),
                  ),
            ),
          ],
          ),
      body: 
      SingleChildScrollView(
              child: Container(
          width: 500,
          height: 700,
          child: Column(
            children:[
              Image.asset('assets/images/credit-card-with-dollar-coin-users-e-commerce-online-shopping-financial-operations-plastic-card-mobile-payment-banking-concept-vector-isolated-illustr.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text('Add Your Bank Account Information', style: TextStyle(fontSize:20), textAlign: TextAlign.center,),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:170),
                    child: Text('Name of Beneficiary'),
                  ),
                  Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextField(decoration: InputDecoration(hintText: 'George Smith',
          hintStyle:TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
          focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                  ),),),
        ),
        
        ),
    ),
                ],
              ),
              SizedBox(
                height:10
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:230),
                    child: Text('Bank Name'),
                  ),
                  Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextField(decoration: InputDecoration(hintText: 'TBC Bank',
          hintStyle:TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
          focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                  ),),),
        ),
        
        ),
    ),
                ],
              ),
              SizedBox(
                height:10
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:190),
                    child: Text('Account Number'),
                  ),
                  Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextField(decoration: InputDecoration(hintText: '01000044FSDW000056',
          hintStyle:TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
          focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                  ),),),
        ),
        
        ),
    ),
                ],
              ),
              SizedBox(
                height:10
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:270),
                    child: Text('Swift'),
                  ),
                  Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextField(decoration: InputDecoration(hintText: 'CARTU 33GEO',
          hintStyle:TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
          focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                  ),),),
        ),
        
        ),
    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20,),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:Color(0xFF005295)
                      ),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:120,vertical:20),
                        child: Text('SAVE', style: TextStyle(color:Colors.white),),
                      )),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}