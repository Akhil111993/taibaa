
import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  int? status;
  String? message;
  String? messageAr;
  List<Datum>? data;

  CategoriesModel({
    this.status,
    this.message,
    this.messageAr,
    this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
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
  String slug;
  String eName;
  String aName;
  String image;
  String thumbImage;
  int subcategoryCount;
  int tripCount;

  Datum({
    required this.id,
    required this.slug,
    required this.eName,
    required this.aName,
    required this.image,
    required this.thumbImage,
    required this.subcategoryCount,
    required this.tripCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slug: json["slug"],
        eName: json["e_name"],
        aName: json["a_name"],
        image: json["image"],
        thumbImage: json["thumb_image"],
        subcategoryCount: json["subcategory_count"],
        tripCount: json["trip_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "e_name": eName,
        "a_name": aName,
        "image": image,
        "thumb_image": thumbImage,
        "subcategory_count": subcategoryCount,
        "trip_count": tripCount,
      };
}
