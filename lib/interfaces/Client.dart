class Client {
  Client(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.facebook,
      this.instagram,
      this.logo,
      this.website,
      this.whatsapp});

  int id;
  String name;
  String email;
  String phone;
  String logo;
  String address;
  String whatsapp;
  String facebook;
  String instagram;
  String website;

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      logo: json['logo'],
      address: json['address'],
      whatsapp: json['whatsapp'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      website: json['website'],
    );
  }
}
