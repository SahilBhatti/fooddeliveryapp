import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/drawer/deliver%20history/accepted_order/acceptModal.dart';
import 'package:demoapp/pages/drawer/deliver%20history/trackhistory/trackhistory.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderAccepted extends StatefulWidget {
  const OrderAccepted({Key? key}) : super(key: key);

  @override
  _OrderAcceptedState createState() => _OrderAcceptedState();
}

class _OrderAcceptedState extends State<OrderAccepted> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black87),
            backgroundColor: Colors.white,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              "Invoice history",
              style: appbarText,
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 18.0,
                onPressed: () {
                  Navigator.of(context).pop(true);
                }),
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child:
         Stack(
           children: [

             Column(children: [
               Column(
                 children: [
                   Container(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height / 6,
                       child: Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Container(
                           decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage('assets/images/invoice.jpg')),
                           ),
                         ),
                       )),
                   Padding(
                       padding: EdgeInsets.zero,
                       child: Text(
                         'Invoice no 30WT43GDTC'.toUpperCase(),
                       )),
                 ],
               ),
               Padding(
                   padding: const EdgeInsets.fromLTRB(20, 6, 20, 10),
                   child: Text(
                     Constants.SLIDER_DESC,
                     textAlign: TextAlign.center,
                     style: headingText,
                   )),
               Padding(
                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Image.asset(
                         'assets/images/pin.png',
                         height: 20,
                       ),
                       SizedBox(
                         width: 1,
                       ),
                       InkWell(
                         onTap: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) =>
                                       TrackingOrderHistory()));
                         },
                        //  child:
                        //  BlinkText(
                        //    'Tracking history',
                        //    style: boldNrmlheadingText,
                        //    beginColor: Colors.blueAccent[700],
                        //    endColor: Colors.deepOrange[700],
                        //    times: 1000,
                        //  ),

                       )
                     ],
                   )),
               Container(
                 child: (AcceptOrderModel.orderStatus.isNotEmpty)
                     ? ListView.separated(
                     shrinkWrap: true,
                     physics: ScrollPhysics(),
                     scrollDirection: Axis.vertical,
                     separatorBuilder: (BuildContext context, int index) =>
                         Divider(
                           height: 0,
                           color: Colors.transparent,
                         ),
                     itemCount: AcceptOrderModel.orderStatus.length,
                     itemBuilder: (BuildContext context, int index) =>
                         OrderStatus(
                             item: AcceptOrderModel.orderStatus[index]))
                     : CircularProgressIndicator(),
               ),
             ]),
           ],
         )
          ),
        )
      ],
    );
  }
}

class OrderStatus extends StatefulWidget {
  final AcceptOrderItem item;

  const OrderStatus({Key? key, required this.item}) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState(item);
}

class _OrderStatusState extends State<OrderStatus> {
  final AcceptOrderItem item;

  _OrderStatusState(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0.0, 20, 4.0),
              child: DottedBorder(
                  color: Colors.grey,
                  dashPattern: const <double>[6, 2],
                  strokeWidth: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 0.5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: InkWell(
                                  onTap: () {
                                   _showDialog(context , item.name,item.price,item.address);
                                  },
                                  child: Container(
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.20,
                                          child:
                                          Container(
                                              height: 100,
                                              margin: EdgeInsets.all(4.0),
                                              child: Image.network(
                                                  item.image,
                                                  fit: BoxFit.cover)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.40,
                                          child: Container(
                                              height: 100,
                                              margin:
                                                  EdgeInsets.only(left: 2),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      child: Text(
                                                        item.name,
                                                        style:
                                                            boldNrmlheadingText,
                                                      )),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2),
                                                    child: Text(
                                                      "From north mohali , panjab",
                                                      style: headingText,
                                                      maxLines: 3,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2),
                                                    child: Text(
                                                      "Price-\$" +
                                                          item.price,
                                                      style: headingText,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 4),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.20,
                                          child: Container(
                                            height: 100,
                                            margin: EdgeInsets.all(4.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Card(
                                                    color: Colors.white,
                                                    elevation: 2,
                                                    child: Column(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets
                                                                    .all(6),
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .add,
                                                              color: Colors
                                                                  .black,
                                                              size: 14,
                                                            )),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets
                                                                    .all(6),
                                                            child: Text(
                                                              "1",
                                                              style:
                                                                  boldNrmlheadingText,
                                                            )),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets
                                                                    .all(6),
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .minus,
                                                              color: Colors
                                                                  .black,
                                                              size: 14,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Reorder".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // child: Dash(
                                      //     direction: Axis.vertical,
                                      //     length: 20,
                                      //     dashGap: 2,
                                      //     dashColor: Colors.grey,
                                      //     dashBorderRadius: 1,
                                      //     dashThickness: 1),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Rate order".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context,String name , String price ,String address) {

  showDialog(   context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
                  4.0)),
          //this right here
          child: Stack(
            children: [

              Container(
                margin: EdgeInsets.only(top:10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2 ,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/paid.png')),
                ),
              ),
              Container(
                width: MediaQuery.of(context)
                    .size
                    .width,
                height: MediaQuery.of(context)
                    .size
                    .height /
                    3,
                child: Padding(
                    padding:
                    EdgeInsets.all(1.0),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment  .end,
                            children: [
                              Padding(padding: EdgeInsets .all(6),
                                child: Align(  alignment:  AlignmentDirectional .topEnd,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pop(true);
                                        },
                                        child: Icon(
                                          Icons
                                              .cancel,
                                          color:
                                          Colors.orange,
                                          size:
                                          24,
                                        ))),
                              ),
                            ],
                          ),

                          Padding(
                              padding: EdgeInsets
                                  .fromLTRB(
                                  10,
                                  0,
                                  10,
                                  0),
                              child: Text(
                                "Delivered To"
                                    .toUpperCase(),
                                textAlign:
                                TextAlign
                                    .center,
                              )),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:   Row(
                              mainAxisAlignment: MainAxisAlignment .start,
                              children: [
                                Container(
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment                     .start,
                                      crossAxisAlignment:       CrossAxisAlignment  .start,
                                      children: [
                                        Padding(
                                            padding:
                                            EdgeInsets
                                                .all(2),
                                            child: Text(
                                              name,
                                              style:
                                              boldNrmlheadingText,
                                              textAlign:
                                              TextAlign
                                                  .start,
                                            )),
                                        Padding(
                                          padding:
                                          EdgeInsets
                                              .all(
                                              2),
                                          child: Text(
                                            "From north mohali , panjab",
                                            style:
                                            headingText,
                                            maxLines: 3,
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                            textAlign:
                                            TextAlign
                                                .start,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets
                                              .all(
                                              2),
                                          child: Text(
                                            "Price-\$" +
                                                price,
                                            style:
                                            headingText,
                                            textAlign:
                                            TextAlign
                                                .start,
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:  Divider(
                              color: Colors.grey,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Padding(
                                padding:
                                EdgeInsets
                                    .all(
                                    10),
                                child: Text(
                                  "Total",
                                  style:
                                  boldNrmlheadingText,
                                  textAlign:
                                  TextAlign
                                      .start,
                                ),
                              ),

                              Padding(
                                padding:
                                EdgeInsets
                                    .all(
                                    10),
                                child: Text(
                                  "\$" +
                                      price,
                                  style:
                                  headingText,
                                  textAlign:
                                  TextAlign
                                      .start,
                                ),
                              )

                            ],
                          )

                        ],
                      ),
                    )),
              ),

            ],
          )
        );
      });
}
