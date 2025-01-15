class UserModel {
  late String id;
  late String name;
  late String email;
  late String image;
  late String username;
  late String role;
  late String token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.image,
      required this.username,
      required this.role,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    username = json['username'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['username'] = username;
    data['role'] = role;
    data['token'] = token;
    return data;
  }
}