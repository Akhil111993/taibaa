import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:taibaa_iinterview/model/title_model.dart';

import '../model/categories_model.dart';
import '../model/slider_model.dart';
import '../constants/network.dart';
import '../model/testimonials_model.dart';

class HomeController extends GetxController {
  final sliderModel = SliderModel().obs;
  final titleModel = TitleModel().obs;
  final categoriesModel = CategoriesModel().obs;
  final testimonialsModel = TestimonialsModel().obs;

  @override
  void onReady() {
    super.onReady();
    getTitle();
    getSlider();
    getCategories();
    getTestimonials();
  }

  void getTitle() async {
    try {
      final response =
          await http.post(Uri.parse('$kBaseUrl/homeTitle'), headers: kHeader);
      titleModel.value = titleModelFromJson(response.body);
    } on Exception {
      titleModel.value = TitleModel(status: 500);
    }
  }

  void getSlider() async {
    try {
      final response =
          await http.post(Uri.parse('$kBaseUrl/getSliders'), headers: kHeader);
      sliderModel.value = sliderModelFromJson(response.body);
    } on Exception {
      sliderModel.value = SliderModel(status: 500);
    }
  }

  void getCategories() async {
    try {
      final response = await http.post(Uri.parse('$kBaseUrl/getCategories'),
          headers: kHeader);
      categoriesModel.value = categoriesModelFromJson(response.body);
    } on Exception {
      categoriesModel.value = CategoriesModel(status: 500);
    }
  }

  void getTestimonials() async {
    try {
      final response = await http.post(Uri.parse('$kBaseUrl/getTestimonials'),
          headers: kHeader);
      testimonialsModel.value = testimonialsModelFromJson(response.body);
    } on Exception {
      sliderModel.value = SliderModel(status: 500);
    }
  }
}
