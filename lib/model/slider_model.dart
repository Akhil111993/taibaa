
import 'dart:convert';

SliderModel sliderModelFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  int? status;
  String? message;
  String? messageAr;
  List<Datum>? data;

  SliderModel({
    this.status,
    this.message,
    this.messageAr,
    this.data,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        status: json["status"],
        message: json["message"],
        messageAr: json["message_ar"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "message_ar": messageAr,
        "data": List<dynamic>.from(data?.map((x) => x.toJson())??[]),
      };
}

class Datum {
  int id;
  String eImage;
  String aImage;
  String slug;

  Datum({
    required this.id,
    required this.eImage,
    required this.aImage,
    required this.slug,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        eImage: json["e_image"],
        aImage: json["a_image"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "e_image": eImage,
        "a_image": aImage,
        "slug": slug,
      };
}
