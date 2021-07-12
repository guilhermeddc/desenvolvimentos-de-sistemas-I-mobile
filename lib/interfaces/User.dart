class User {
  User({this.id, this.email, this.password, this.confirmPassword});

  int id;
  String email;
  String password;
  String confirmPassword;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
}
