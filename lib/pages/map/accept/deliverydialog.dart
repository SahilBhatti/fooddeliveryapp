import 'package:demoapp/pages/map/accept/success.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class Delivery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeliveryState();
}

class DeliveryState extends State<Delivery>
    with SingleTickerProviderStateMixin {
  var _result;
  late final AnimationController controller;
  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  bool navigateToPage = false;
  bool navigateToPage2 = false;
  bool navigateToPage3 = false;
  bool navigateToPage4 = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              padding: EdgeInsets.only(left: 15, top: 0),
              height: 420.0,
              width: 280.0,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: Text(
                      'Where did you leave the Order ?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  RadioListTile(
                    selectedTileColor: Colors.green,
                      activeColor: HexColor(orange),
                      title: Text('I found the customer'),
                      value: 0,
                      groupValue: _result,
                      onChanged: (value) {
                        setState(() {
                          _result = value;
                          navigateToPage=true;
                        });
                      }),
                  RadioListTile(
                      activeColor: HexColor(orange),
                      title: Text('Front Door'),
                      value: 1,
                      groupValue: _result,
                      onChanged: (value) {
                        setState(() {
                          _result = value;
                          navigateToPage2=true;
                        });
                      }),
                  RadioListTile(
                      activeColor: HexColor(orange),
                      title: Text('Front Desk'),
                      value: 2,
                      groupValue: _result,
                      onChanged: (value) {
                        setState(() {
                          _result = value;
                          navigateToPage3=true;
                        });
                      }),
                  RadioListTile(
                      activeColor: HexColor(orange),
                      title: Text('Other Location'),
                      value: 3,
                      groupValue: _result,
                      onChanged: (value) {
                        setState(() {
                          _result = value;
                          navigateToPage4=true;
                        });
                      }),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 15, right: 30),
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (navigateToPage||navigateToPage2||navigateToPage3||navigateToPage4){
                                Navigator.pop(context);
                                showDialog(
                              context: context,
                              builder: (_) => Success(),
                            );
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              'Complete Delivery',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
