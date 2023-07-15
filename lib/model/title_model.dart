
import 'dart:convert';

TitleModel titleModelFromJson(String str) =>
    TitleModel.fromJson(json.decode(str));

String titleModelToJson(TitleModel data) => json.encode(data.toJson());

class TitleModel {
  int? status;
  String? message;
  String? messageAr;
  Data? data;

  TitleModel({
    this.status,
    this.message,
    this.messageAr,
    this.data,
  });

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(
        status: json["status"],
        message: json["message"],
        messageAr: json["message_ar"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "message_ar": messageAr,
        "data": data?.toJson(),
      };
}

class Data {
  List<String> eTitle;
  List<String> aTitle;

  Data({
    required this.eTitle,
    required this.aTitle,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        eTitle: List<String>.from(json["e_title"].map((x) => x)),
        aTitle: List<String>.from(json["a_title"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "e_title": List<dynamic>.from(eTitle.map((x) => x)),
        "a_title": List<dynamic>.from(aTitle.map((x) => x)),
      };
}
