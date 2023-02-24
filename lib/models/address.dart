class Address {
  final String name;
  final String? houseNo;
  final String? buildingName;
  final String? roadName;
  final String? area;
  final String pincode;
  final String city;
  final String state;
  final String? nearbyLocation;
  final String mobileNo;
  bool isSelected;

  Address(
      {required this.name,
      this.houseNo,
      this.buildingName,
      this.roadName,
      this.area,
      required this.pincode,
      required this.city,
      required this.state,
      this.nearbyLocation,
      required this.mobileNo,
      this.isSelected = false});
}
