class ContactModel {
  final String name, phone;

  ContactModel({
    required this.name,
    required this.phone,
  });
  factory ContactModel.fromJson(Map<dynamic, dynamic> json) => ContactModel(
        name: json['name'],
        phone: json['number'],
      );
}
