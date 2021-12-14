import 'package:demoapp/pages/Wallet/AddPaypalAddress/AddPaypalAddress.dart';
import 'package:demoapp/pages/Wallet/creditcard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Paymentmethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Payment(),
    );
  }
}

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool navigateToPage = false;
  bool navigateToPage2 = false;
  bool navigateToPage3 = false;
  var _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 18.0,
            onPressed: () {
              // Navigator.of(context).pop(true);
            }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/Group 15214.png'))
        ],
      ),
      body: Column(children: [
        Image.asset(
            'assets/images/credit-card-with-dollar-coin-users-e-commerce-online-shopping-financial-operations-plastic-card-mobile-payment-banking-concept-vector-isolated-illustr.png'),
        Text(
          'Add your card. This need for delivery product',
        ),
        RadioListTile(
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
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: DottedBorder(
              radius: Radius.circular(5),
              borderType: BorderType.RRect,
              child: ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Credit Card'),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          if (navigateToPage) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Creditcard()));
                          }
                        });
                      },
                      icon: Icon(Icons.navigate_next)))),
        ),
        RadioListTile(
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
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: DottedBorder(
              radius: Radius.circular(5),
              borderType: BorderType.RRect,
              child: ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('PayPal'),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          if (navigateToPage2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPaypalAddress()));
                          }
                        });
                      },
                      icon: Icon(Icons.navigate_next)))),
        ),
        RadioListTile(
            activeColor: Colors.orange,
            title: Text('Set as primary'),
            value: 2,
            groupValue: _result,
            onChanged: (value) {
              setState(() {
                _result = value;
                navigateToPage3 = true;
              });
            }),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: DottedBorder(
              radius: Radius.circular(5),
              borderType: BorderType.RRect,
              child: ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Were Transfer'),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          if (navigateToPage3) {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Creditcard()));
                          }
                        });
                      },
                      icon: Icon(Icons.navigate_next)))),
        ),
      ]),
    );
  }
}
