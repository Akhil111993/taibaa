
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? message;
  String? messageAr;
  String? devOtp;
  String? phoneCode;
  String? phone;

  LoginModel({
    this.status,
    this.message,
    this.messageAr,
    this.devOtp,
    this.phoneCode,
    this.phone,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        messageAr: json["message_ar"],
        devOtp: json["dev_otp"],
        phoneCode: json["phone_code"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "message_ar": messageAr,
        "dev_otp": devOtp,
        "phone_code": phoneCode,
        "phone": phone,
      };
}
