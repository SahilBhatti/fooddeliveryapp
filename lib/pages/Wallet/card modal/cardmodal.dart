class CardModel {
  static final cards = [
    CardItem( 0, 'assets/images/credit_card.png', "Credit card"),
    CardItem(1,'assets/images/debit.png', "Debit card"),
  ];
}

class CardItem {
  final int index;
  final String image;
  final String cardName;

  CardItem(this.index,this.image, this.cardName);
}
