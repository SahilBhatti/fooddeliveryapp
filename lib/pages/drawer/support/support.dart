import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/drawer/support/faq/faQsupport.dart';
import 'package:demoapp/pages/drawer/support/onlinesupport/onlinesupport.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
          "Support",
          style: TextStyle(color:Colors.black),
        ),
        leading: IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.of(context).pop(true)
                                        },
                  ) ,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child:
        Column(children: [
          Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/24support.png')),
                      ),
                    ),
                  )),
        
            ],
          ),
        
          Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Support 24/7'.toUpperCase(),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 6, 30, 10),
              child: Text(
                Constants.SLIDER_DESC,
                textAlign: TextAlign.center,
                style: headingText,
              )),
        
          Container(
            margin: EdgeInsets.only(top: 20),
            child:   Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
        
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0.0, 40, 0.0),
                    child: DottedBorder(
                      color: Colors.grey,
                      dashPattern: const <double>[6, 1],
                      strokeWidth: 1,
                      child:
                      Container(
                        decoration: BoxDecoration(
                          color: HexColor(cream),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white, spreadRadius: 0.5),
                          ],
                        ),
                        child:
                        ListTile(
                          onTap: ()
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OnlineSupport()));
                          },
                          dense: true,
                          visualDensity: VisualDensity(
                              horizontal: 0, vertical: -1),
                          leading: ImageIcon(AssetImage('assets/images/support.png')),
                          title: Text(
                            "Online support",
                            textScaleFactor: 1,
                            style: headingText,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,
        
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        
          Container(
            margin: EdgeInsets.only(top: 20),
            child:   Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
        
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0.0, 40, 0.0),
                    child:
                    DottedBorder(
                      color: Colors.grey,
                      dashPattern: const <double>[6, 1],
                      strokeWidth: 1,
                      child:
                      Container(
                        decoration: BoxDecoration(
                          color: HexColor(cream),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white, spreadRadius: 0.5),
                          ],
                        ),
                        child:
                        ListTile(
                          onTap: ()
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FaqSupport()));
                          },
                          dense: true,
                          visualDensity: VisualDensity(
                              horizontal: 0, vertical: -1),
                          leading: Icon(
                            Icons.contact_support_outlined, ),
                          title: Text(
                            "FAQ",
                            textScaleFactor: 1,
                            style: headingText,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_sharp,size: 20,
        
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        
        
        ]),
      ),
    );
  }
}
