import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/Wallet/addressModal/address.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GetAllAddress extends StatefulWidget {
  const GetAllAddress({Key? key}) : super(key: key);

  @override
  _GetAllAddressState createState() => _GetAllAddressState();
}

class _GetAllAddressState extends State<GetAllAddress> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          margin: EdgeInsets.only(top:10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:30),
                        child:  IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            iconSize: 18.0,
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            }),
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                    'Add Address',
                    style: boldheadingText,
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Text(
                    'Add your address and personal details. This need for delivery product',
                    textAlign: TextAlign.center,
                    style: headingText,
                  )),
              Container(
                child: (AddressModel.deliveryAddress.isNotEmpty)
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                              height: 0,
                              color: Colors.transparent,
                            ),
                        itemCount: AddressModel.deliveryAddress.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Addresses(
                                item: AddressModel.deliveryAddress[index]))
                    : CircularProgressIndicator(),
              ),
              Stack(
                children: [
                  Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Stack(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor(orange),
                              padding: EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              elevation: 1,
                              minimumSize: Size(double.infinity,
                                  40), // double.infinity is the width and 30 is the height
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AddNewAddress()));
                            },
                            child: Text(
                              "Add new Address".toUpperCase(),
                              style: btnWhiteText,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             AddNewAddress()));
                                    },
                                    child: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            border: Border.all(
                                                color:
                                                    HexColor(Constants.orange),
                                                width: 1)),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 20.0,
                                            color: Colors.black87,
                                          ),
                                        )),
                                  ))
                            ],
                          ),
                        ],
                      )),
                ],
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: HexColor(blue),
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      elevation: 8.0,
                      minimumSize: Size(double.infinity,
                          44), // double.infinity is the width and 30 is the height
                    ),
                    onPressed: () {
                      // validateData();
                    },
                    child: Text(Constants.SAVE_PRIMARY.toUpperCase(),
                        style: btnWhiteText),
                  )),
            ],
          )),
    );
  }
}

class Addresses extends StatefulWidget {
  final DeliveryAddress item;

  const Addresses({Key? key, required this.item}) : super(key: key);

  @override
  _AddressesState createState() => _AddressesState(item);
}

class _AddressesState extends State<Addresses> {
  DeliveryAddress item;

  _AddressesState(this.item);

  int _groupValue = -1;

//   physics: ClampingScrollPhysics(),
  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0,0,0,4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: Row(
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: _groupValue,
                      onChanged: (newValue) => {_groupValue = (newValue) as int},
                      activeColor: Colors.red,
                    ),
                    Flexible(
                      child: new Container(
                        padding: new EdgeInsets.only(right: 0.0),
                        child: new Text(
                          item.address,
                          overflow: TextOverflow.ellipsis,
                          style: headingText,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
