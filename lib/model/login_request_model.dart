import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  String phoneCode;
  String phone;

  LoginRequestModel({
    required this.phoneCode,
    required this.phone,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        phoneCode: json["phone_code"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone_code": phoneCode,
        "phone": phone,
      };
}
