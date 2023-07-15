import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taibaa_iinterview/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 250,
                ),
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Form(
                key: loginController.formKey,
                child: Column(
                  children: [
                    const Text(
                      'Enter your Phone Number and country code',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      message: 'Please enter a valid phone code',
                      hint: '971',
                      onSaved: (value) => loginController
                          .loginRequestModel.phoneCode = '+$value',
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      message: 'Please enter a valid phone number',
                      hint: '9494949494',
                      onSaved: (value) =>
                          loginController.loginRequestModel.phone = value!,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 50),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                  ),
                ),
              ),
              Obx(() {
                final loginModel = Get.find<LoginController>().loginModel.value;
                if (loginModel.status == -1) {
                  return ElevatedButton(
                    onPressed: () => loginController.login,
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      loginController.login(context);
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      )),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String message;
  final String hint;
  const CustomTextFormField({
    super.key,
    required this.message,
    required this.hint,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        border: const OutlineInputBorder(),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 20,
        ),
        contentPadding: const EdgeInsets.all(15),
      ),
      onSaved: onSaved,
      style: const TextStyle(fontSize: 20),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\+?[0-9]+$')),
      ],
      keyboardType: TextInputType.phone,
      validator: (value) => value == null || value.isEmpty ? message : null,
      maxLines: 1,
    );
  }
}
