class Group {
  final int id;
  final String image;
  final String name;
  final int members;

  Group(
      {required this.id,
      required this.image,
      required this.name,
      required this.members});

  get isMember => null;
}
