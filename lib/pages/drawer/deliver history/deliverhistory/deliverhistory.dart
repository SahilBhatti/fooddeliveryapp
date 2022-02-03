import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/drawer/deliver%20history/deliverhistory/deliverhistoryModal.dart';
import 'package:demoapp/pages/drawer/deliver%20history/trackhistory/trackhistory.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderHistory extends StatefulWidget {

  const OrderHistory({Key? key}) : super(key: key);
  @override
  _OrderHistoryState createState() => _OrderHistoryState();

}
class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text("Delivery History",style: TextStyle(color:Colors.black),),

        leading: IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(userProfile: '',email:"",name:'')))
                                        },
                  ) ,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(30, 6, 30, 10),
                            child: Text(
                              "Delivery history",
                              textAlign: TextAlign.start,
                              style: boldheadingText,
                            )),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                            child: Text(
                              Constants.SLIDER_DESC,
                              textAlign: TextAlign.start,
                              style: headingText,
                            )),
                      ],
                    )
                  ],
                )),
            Container(
              child: (OrderHistoryModel.orderStatus.isNotEmpty)
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                            height: 0,
                            color: Colors.transparent,
                          ),
                      itemCount: OrderHistoryModel.orderStatus.length,
                      itemBuilder: (BuildContext context, int index) =>
                          OrderStatus(
                              item: OrderHistoryModel.orderStatus[index]))
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      )),
    );
  }
}

class OrderStatus extends StatefulWidget {
  final OrderHistoryItem item;

  const OrderStatus({Key? key, required this.item}) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState(item);
}

class _OrderStatusState extends State<OrderStatus> {
  final OrderHistoryItem item;
  bool crossVisible = false ;
  var tickVisible = false;

  _OrderStatusState(this.item);

  @override
  void initState() {
    super.initState();
    setState(() {

      if(item.status=="0")
        {
          crossVisible=!crossVisible;
        }
      else{
        tickVisible=!tickVisible;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0.0, 30, 4.0),
              child: DottedBorder(
                color: Colors.grey,
                dashPattern: const <double>[6, 2],
                strokeWidth: 1,
                child:
                  InkWell(

                onTap: ()
                {
                  if(item.status=="0")
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackingOrderHistory())
                    );
                  }
                  else{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackingOrderHistory())
                    );
                  }


                  },
                child:
                Container(
                    decoration: BoxDecoration(
                      color: HexColor(cream),
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 0.5),
                      ],
                    ),
                    child:
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            10,
                            10,
                            10,
                            2,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(  item.orderNumber,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 1,
                                style: boldNrmlheadingText,
                              ),

                            Row(
                              children: [
                                Visibility(
                                  child:  Image.asset('assets/images/checked (2).png',height: 14,),
                                maintainState: true,
                                visible: crossVisible,
                                ),

                                Visibility(child:  Image.asset('assets/images/noun_denied_796261.png',height: 14,),
                                  maintainState: true,
                                visible:tickVisible,)
                              ],
                            )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: new Container(
                                padding: new EdgeInsets.fromLTRB(10, 4, 10,  0, ),
                                child:
                                new Text(item.name,
                                  textScaleFactor: 1,
                                  style: headingText,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: new Container(
                                padding: new EdgeInsets.fromLTRB(10, 4, 10,  0, ),
                                child:
                                new Text("Price - "+item.price,
                                  textScaleFactor: 1,
                                  style: headingText,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: new Container(
                                padding: new EdgeInsets.fromLTRB(10, 4, 10,  10, ),
                                child:
                                new Text(item.address,
                                  textScaleFactor: 1,
                                  style: headingText,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    )),
              )
              ),
            )
          ],
        ),
      ),
    );
  }
}
