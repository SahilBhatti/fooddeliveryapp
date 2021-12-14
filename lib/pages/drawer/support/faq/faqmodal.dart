import 'package:demoapp/constants/constants.dart';

class FAQModel {
  static final faq = [

    FAQItem("Heading item ",Constants.SLIDER_DESC),
    FAQItem("Heading item ",Constants.SLIDER_DESC),
    FAQItem("Heading item ",Constants.SLIDER_DESC),
    FAQItem("Heading item ",Constants.SLIDER_DESC),
    FAQItem("Heading item ",Constants.SLIDER_DESC),
    FAQItem("Heading item ",Constants.SLIDER_DESC),



  ];
}

class FAQItem {
  final String heading;
  final String desp;

  FAQItem(this.heading,this.desp);
}
