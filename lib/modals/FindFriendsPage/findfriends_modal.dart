class Contact {
  final String name;
  final String avatar;
  final String? status;
  bool selected;

  Contact(
      {required this.name,
      required this.avatar,
      this.status,
      this.selected = false});
}
