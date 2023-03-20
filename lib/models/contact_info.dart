class ContactInfo {
  final String title;
  final String number;
  bool selected;

  ContactInfo({
    required this.title,
    required this.number,
    this.selected = false,
  });
}
