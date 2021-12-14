class AddressModel {
  static final deliveryAddress = [
    DeliveryAddress(
        "Home", "House-23 ,Phase 16 ,Sector 25,Near 3B2 chowk,Mohali ,India"),
    DeliveryAddress(
        "Home", "House-23 ,Phase 18 ,Sector 45, Near PTL chowk ,Mohali ,India"),

    DeliveryAddress("Home",
        "House-93 ,Phase 86 ,Sector 54, Near Diploast chowk, Mohali ,India"),
  ];
}

class DeliveryAddress {
  final String name;
  final String address;

  DeliveryAddress(this.name, this.address);
}
