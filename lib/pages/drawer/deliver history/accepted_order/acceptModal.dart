class AcceptOrderModel {
  static final orderStatus = [

    AcceptOrderItem("Veg burger","Order number-#4435245","100","House-234 , Ward-5 ,Sh[jhitbfjihinb juuhgu hgouh nifghfiohivnagar h hjgig gigbi unnhyug ygguyg,Mandi HP","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr9sN5S7GI_uqOnD6W-VgOpLc-tRStU_YNoQ&usqp=CAU"),
    AcceptOrderItem("Coffee","Order number-#4435245","100","House-234 , Ward-5 ,Shivnagar ,Mandi HP","https://static.toiimg.com/thumb/84855613.cms?width=680&height=512&imgsize=230846"),

    AcceptOrderItem("Pizza","Order number-#4435245","100","House-234 , Ward-5 ,Shivnagar ,Mandi HP","https://cdn4.singleinterface.com/files/banner_images/1093/9682_1602656979_VegExoticamin.jpg"),
    AcceptOrderItem("Pasta","Order number-#4435245","100","House-234 , Ward-5 ,Shivnagar ,Mandi HP","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvOBsdOXEwOQToE0g2u-1IJUE77KdwLtgvyA&usqp=CAU"),
    AcceptOrderItem("Noodels","Order number-#4435245","100","House-234 , Ward-5 ,Shivnagar ,Mandi HP","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb740UOGQqlVMpuwrewg4yEfIWldG-PZ78xg&usqp=CAU"),
    AcceptOrderItem("Coffee","Order number-#4435245","100","House-234 , Ward-5 ,Shivnagar ,Mandi HP","https://m.media-amazon.com/images/I/517hnnp3CNL._SX425_.jpg"),


  ];
}

class AcceptOrderItem {
  final String name;
  final String price;
  final String address;
  final String orderNumber;
  final String image;

  AcceptOrderItem(this.name,this.orderNumber, this.price, this.address,this.image);
}
