import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/drawer/support/faq/faqmodal.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FaqSupport extends StatefulWidget {
  const FaqSupport({Key? key}) : super(key: key);

  @override
  _FaqSupportState createState() => _FaqSupportState();
}

class _FaqSupportState extends State<FaqSupport> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "FAQ",
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
                            image: AssetImage('assets/images/faq.png')),
                      ),
                    ),
                  )),
            ],
          ),
          Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'FAQ'.toUpperCase(),
              )),

          Padding(
              padding: const EdgeInsets.fromLTRB(30, 6, 30, 20),
              child: Text(
                Constants.SLIDER_DESC,
                textAlign: TextAlign.center,
                style: headingText,
              )),

          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: (FAQModel.faq.isNotEmpty)
                ? ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(
                      height: 0,
                      color: Colors.white,
                    ),
                itemCount: FAQModel.faq.length,
                itemBuilder: (BuildContext context, int index) =>
                    FAQData(
                        item: FAQModel.faq[index]))
                : CircularProgressIndicator(),
          ),



        ]),
      ),
    );
  }
}


class FAQData extends StatefulWidget {
  final FAQItem item;
  const FAQData({Key? key, required this.item}) : super(key: key);

  @override
  _FAQDataState createState() => _FAQDataState(item);
}

class _FAQDataState extends State<FAQData> {
  final FAQItem item;
  _FAQDataState(this.item);
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 0.0, 30, 0.0),

        child: DottedBorder(
          color: Colors.grey,
          dashPattern: const <double>[6, 3],
          strokeWidth: 1,
          child:
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.white, spreadRadius: 0.5),
              ],
            ),
            child:
            Container(
                child:
             Theme(
               data: Theme.of(context).copyWith(dividerColor: Colors.white),
              child:   ExpansionTile(
                collapsedBackgroundColor: Colors.white10,
                title: Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        item.heading,
                        textAlign: TextAlign.start,
                      )),
                children: [

                 Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 10, 16),
                      child: Text(
                        item.desp,
                        textAlign: TextAlign.start,
                        style: headingText,
                      ))


                ],
                collapsedTextColor: HexColor(orange),
                iconColor: HexColor(orange),



              ),
            )
            ),
          ),
        ),
      );

  }


}

