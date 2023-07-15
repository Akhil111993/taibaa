
import 'dart:convert';

TestimonialsModel testimonialsModelFromJson(String str) =>
    TestimonialsModel.fromJson(json.decode(str));

String testimonialsModelToJson(TestimonialsModel data) =>
    json.encode(data.toJson());

class TestimonialsModel {
  int? status;
  String? message;
  String? messageAr;
  List<Datum>? data;

  TestimonialsModel({
    this.status,
    this.message,
    this.messageAr,
    this.data,
  });

  factory TestimonialsModel.fromJson(Map<String, dynamic> json) =>
      TestimonialsModel(
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
  String eName;
  String aName;
  String eDesignation;
  String aDesignation;
  String eComment;
  String aComment;
  String image;
  String thumbImage;
  String createdAt;

  Datum({
    required this.id,
    required this.eName,
    required this.aName,
    required this.eDesignation,
    required this.aDesignation,
    required this.eComment,
    required this.aComment,
    required this.image,
    required this.thumbImage,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        eName: json["e_name"],
        aName: json["a_name"],
        eDesignation: json["e_designation"],
        aDesignation: json["a_designation"],
        eComment: json["e_comment"],
        aComment: json["a_comment"],
        image: json["image"],
        thumbImage: json["thumb_image"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "e_name": eName,
        "a_name": aName,
        "e_designation": eDesignation,
        "a_designation": aDesignation,
        "e_comment": eComment,
        "a_comment": aComment,
        "image": image,
        "thumb_image": thumbImage,
        "created_at": createdAt,
      };
}
