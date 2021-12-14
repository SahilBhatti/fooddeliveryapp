import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cart extends StatefulWidget {
  // final int value;
  // // final String product;
  // final String foodName;
  // final Image imageName;
  Cart(
      {
        Key? key,
      // required this.value,
      // required this.foodName,
      // required this.imageName,
      })
      : super(key: key);
  @override
  State<Cart> createState() => _CartViewState();
}

class _CartViewState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Cart",style: TextStyle(color:Colors.black),
          ),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {Navigator.of(context).pop(true)},
        ),
        backgroundColor: Colors.white,
      ),
      body: Container()
    );
  }
}
