class City {
  City({this.id, this.name, this.stateId});

  String id;
  String name;
  String stateId;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      stateId: json['state_id'],
    );
  }
}
