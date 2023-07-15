import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:taibaa_iinterview/model/login_request_model.dart';

import '../model/login_model.dart';
import '../constants/network.dart';
import '../view/onboarding.dart';

class LoginController extends GetxController {
  final loginModel = LoginModel().obs;
  final formKey = GlobalKey<FormState>();
  final loginRequestModel = LoginRequestModel(phone: '', phoneCode: '');

  void login(BuildContext context) async {
    if ((formKey.currentState?.validate() ?? false)) {
      formKey.currentState?.save();
      try {
        loginModel.value = LoginModel(status: -1);
        Map<String, String> header = kHeader;
        final response = await http.post(Uri.parse('$kBaseUrl/login'),
            headers: header..putIfAbsent('uuid', () => 'text'),
            body: loginRequestModelToJson(loginRequestModel));
        loginModel.value = loginModelFromJson(response.body);

        Fluttertoast.showToast(
          msg: loginModel.value.message ??
              (loginModel.value.status == 200
                  ? 'Login Successful'
                  : 'Login Failed'),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[600],
        );

        if (context.mounted && loginModel.value.status == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Onboarding()));
        }
      } on Exception {
        loginModel.value = LoginModel(status: 500);
        Fluttertoast.showToast(
          msg: 'Login Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[600],
        );
      }
    }
  }
}
