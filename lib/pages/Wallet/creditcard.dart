// import 'package:demoapp/constants/constants.dart';
// import 'package:demoapp/pages/Wallet/addcard.dart';
// import 'package:demoapp/pages/Wallet/card%20modal/cardmodal.dart';
// import 'package:demoapp/utlis/platte.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class Creditcard extends StatefulWidget {
//   const Creditcard({Key? key}) : super(key: key);

//   @override
//   _CreditcardState createState() => _CreditcardState();
// }

// class _CreditcardState extends State<Creditcard> {
//   @override
//   Widget build(BuildContext context) {
//     return
//       Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color:Colors.black87),
//         backgroundColor: Colors.white,
//         elevation: 0.0,

//         leading:
//         IconButton(
//             icon: Icon(Icons.arrow_back_ios),
//             iconSize: 18.0,
//             onPressed: () {
//               Navigator.of(context).pop(true);
//             }),
//       ),


//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//               children: [
//                 Container(

//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * 0.15,
//                     child: Stack(
//                       children: [

//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: [
//                          Padding(
//                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
//                              child: Text("Credit card setting",
//                                textAlign: TextAlign.start,
//                                style: boldheadingText,
//                              )),
//                          Padding(
//                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
//                              child: Text(Constants.SLIDER_DESC,
//                                textAlign: TextAlign.start,
//                                style: headingText,
//                              )),
//                        ],
//                      )

//                       ],
//                     )),


//                 Container(
//                   child: (CardModel.cards.isNotEmpty)
//                       ? ListView.separated(
//                       shrinkWrap: true,
//                       physics: ScrollPhysics(),
//                       scrollDirection: Axis.vertical,
//                       separatorBuilder: (BuildContext context, int index) =>
//                           Divider(
//                             height: 0,
//                             color: Colors.transparent,
//                           ),
//                       itemCount: CardModel.cards.length,
//                       itemBuilder: (BuildContext context, int index) =>
//                           PaymentCardSetting(item: CardModel.cards[index]))
//                       : CircularProgressIndicator(),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.fromLTRB(40, 20, 40, 30),
//                   child: DottedBorder(
//                     color: Colors.grey,

//                     dashPattern:const <double>[6, 1],
//                     strokeWidth: 1,

//                     child: Container(

//                       decoration: BoxDecoration(
//                         color:HexColor(cream),
//                         boxShadow: [
//                           BoxShadow(color: Colors.white, spreadRadius: 0.5),
//                         ],
//                       ),
//                       child: ElevatedButton(

//                         style: ElevatedButton.styleFrom(
//                           side: BorderSide(width: 1.0, color: Colors.white),
//                           primary: Colors.white,
//                           elevation: 0.0,
//                           minimumSize: Size(double.infinity,
//                               44), // double.infinity is the width and 30 is the height
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Addcard()),
//                           );
//                         },
//                         child: Text("Add new Card".toUpperCase(),
//                             style: headingText),
//                       )

//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }


// class PaymentCardSetting extends StatefulWidget {
//   final CardItem item;

//   const PaymentCardSetting({Key? key, required this.item}) : super(key: key);
//   @override
//   _PaymentCardSettingState createState() => _PaymentCardSettingState(item);
// }

// class _PaymentCardSettingState extends State<PaymentCardSetting> {
//   final CardItem item;
//   int _selectedRadioIndex = -1;

//   _PaymentCardSettingState(this.item);


//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                   padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
//                   child: Row(
//                     children: [
//                       new Radio(value: item.index, groupValue: _selectedRadioIndex,
//                           activeColor: Colors.orange,
//                           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           onChanged: (value)=>{
//                             setState(() {

//                               _selectedRadioIndex =  (value) as int;
//                               print("value is $_selectedRadioIndex");
//                             })
//                           }           ),
//                       new Text(
//                         "Set as primary".toUpperCase(),
//                         overflow: TextOverflow.ellipsis,
//                         style: headingText,
//                         maxLines: 2,
//                       ),
//                     ],
//                   )),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 0.0, 30, 0.0),
//               child: SizedBox(
//                 height: 150,
//                 child:  Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(item.image),fit: BoxFit.fitHeight ),)
//                 ),
//               )
//               )
//             ],
//           ),
//         ));
//   }
// }


import 'package:demoapp/pages/Wallet/addcard.dart';
import 'package:demoapp/pages/Wallet/payment_methods.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Creditcard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CardView(),
      
    );
  }
}

class CardView extends StatefulWidget{
  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool navigateToPage = false;
  bool navigateToPage2 = false;
  var _result;
//   void _visibilitymethod() {
//     setState(() {
//       if (navigateToPage&navigateToPage2) {
//         navigateToPage = false;
//       } else {
//         navigateToPage = true;
//       }
//     });
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Paymentmethod()));
          },
          icon: Icon(Icons.arrow_back_ios),color: Colors.black,),
          actions: [IconButton(onPressed: (){}, icon: Image.asset('assets/images/Group 15214.png'))],
      ),
      body: SingleChildScrollView(
              child: Column(children:[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left:30),
              child: Text('Credit Card Settings',style: TextStyle(fontSize:20),),
            )),
          Padding(
            padding: const EdgeInsets.only(right:20),
            child: Text('Add your card. This need for delivery product',),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: RadioListTile(
              activeColor: Colors.orange,
                      title: Text('Set as primary'),
                      value: 0,
                      groupValue: _result,
                      onChanged: (value) {
                        setState(() {
                          _result = value;
                          navigateToPage = true;
                        });
                      }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Image.asset('assets/images/credit_card.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: RadioListTile(
              activeColor: Colors.orange,
                      title: Text('Set as primary'),
                      value: 1,
                      groupValue: _result,
                      onChanged: (value) {
                        setState(() {
                          _result = value;
                          navigateToPage2 = true;
                        });
                      }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Image.asset('assets/images/debit.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(30),
              child: TextButton(onPressed: _visibilitymethod,
              child: Padding(
                padding: const EdgeInsets.only(left:80,right:80),
                child: Text('+ ADD NEW CARD',style: TextStyle(color:Colors.black),),
              ),)),
          ),
          SizedBox(
            height:20
          )
        ]),
      ),
    );
    
  }
  void _visibilitymethod() {
    setState(() {
      if (navigateToPage || navigateToPage2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Addcard()));
                  }
    });
  }
}