// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.userName,
    required this.password,
  });

  String userName;
  String password;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    userName: json["user_name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "password": password,
  };
}
