class OrderHistoryModel {
  static final orderStatus = [
    OrderHistoryItem("KFC chicken rice bowl","Order number-#4435245","100","1","House-234 , Ward-5 ,Shivnagar , Hamirpur HP India"),
    OrderHistoryItem("Veg burger","Order number-#4435245","100","1","House-234 , Ward-5 ,Shivnagar ,Mandi HP"),
    OrderHistoryItem("Noodels","Order number-#4435245","100","0","House-234 , Ward-5 ,Shivnagar ,Mandi HP"),
    OrderHistoryItem("Pasta","Order number-#4435245","100","0","House-234 , Ward-5 ,Shivnagar ,Mandi HP"),
    OrderHistoryItem("Veg meal","Order number-#4435245","100","0","House-234 , Ward-5 ,Shivnagar ,Mandi HP"),
    OrderHistoryItem("Sea food","Order number-#4435245","100","0","House-234 , Ward-5 ,Shivnagar ,Mandi HP"),
    OrderHistoryItem("Pasta","Order number-#4435245","100","0","House-234 , Ward-5 ,Shivnagar ,Mandi HP"),
    OrderHistoryItem("Veg meal","Order number-#4435245","100","1","House-234 , Ward-5 ,Shivnagar ,Mandi HP"),
    OrderHistoryItem("Sea food","Order number-#4435245","100","1","House-234 , Ward-5 ,Shivnagar ,Mandi HP"),
  ];
}

class OrderHistoryItem {
  final String name;
  final String price;
  final String status;
  final String address;
  final String orderNumber;

  OrderHistoryItem(this.name,this.orderNumber, this.price,this.status, this.address);
}
