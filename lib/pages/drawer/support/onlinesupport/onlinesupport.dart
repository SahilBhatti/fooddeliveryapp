import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OnlineSupport extends StatefulWidget {
  const OnlineSupport({Key? key}) : super(key: key);

  @override
  _OnlineSupportState createState() => _OnlineSupportState();
}

class _OnlineSupportState extends State<OnlineSupport> {
  var maxLines = 5;

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
        child: Column(children: [
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
            margin: EdgeInsets.only(top: 4),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //     padding: const EdgeInsets.fromLTRB(40, 20.0, 40, 4.0),
                  //     child: Text(
                  //       'Comments',
                  //       style: boldNrmOrangeheadingText,
                  //     )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 2.0, 40, 0.0),
                      child: Container(
                        child: Form(
                          child: TextFormField(
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            maxLines: maxLines,
                            decoration: InputDecoration(
                              labelText: "Comment here...",
                              labelStyle: headingText,
                              // fillColor: Colors.red,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black45, width: 1),
                              ),
                              alignLabelWithHint: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      )),
                ]),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: Colors.white),
                  primary: HexColor(Constants.orange),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  elevation: 0.5,
                  minimumSize: Size(double.infinity,
                      44), // double.infinity is the width and 30 is the height
                ),
                onPressed: () {},
                child: Text("Send message".toUpperCase(), style: btnWhiteText),
              )),
        ]),
      ),
    );
  }
}
