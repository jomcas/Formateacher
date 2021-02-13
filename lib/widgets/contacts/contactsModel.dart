class Contact {
  String fullName;
  String contactNumber;
  bool isSelected;

  Contact({this.fullName, this.contactNumber, this.isSelected});

  Contact.fromJson(var value) {
    this.fullName = value["name"];
    this.contactNumber = value["phone"];
    this.isSelected = false;
  }
}
