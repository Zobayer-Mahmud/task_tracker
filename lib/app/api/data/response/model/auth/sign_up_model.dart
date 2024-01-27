class SignUpModel {
  String? name;
  String? email;
  String? password;
  int? age;

  SignUpModel({this.name, this.email, this.password, this.age});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['age'] = age;
    return data;
  }
}
