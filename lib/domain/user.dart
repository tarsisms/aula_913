class User {
  late String username;
  late String password;

  User(this.username, this.password);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    json['password'] = password;
    return json;
  }
}
