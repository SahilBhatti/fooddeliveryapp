class EmailAddressModel {
  static final emailAddress = [
    EmailAddressItem(
        "Home", "vinichauhan93@gmail.com"),
    EmailAddressItem( "Home", "abc@paypal.com"),


  ];
}

class EmailAddressItem {
  final String name;
  final String address;
  EmailAddressItem(this.name, this.address);

}
