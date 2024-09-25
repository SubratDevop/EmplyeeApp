import 'package:employee_app/core/resources/screen_size.dart';
import 'package:employee_app/core/widgets/buttons/submit_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/app_text_size.dart';
import '../../../core/resources/textFormField_decoraion.dart';
import '../../../core/widgets/loading_indecator.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  static String? userMobileNo;

  LoginScreen({super.key});
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenSize.height(context) / 2,
                width: ScreenSize.width(context),
                child: Image.asset(
                  "assets/images/login_header.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H1Text(
                      tittle: "Welcome back!",
                      textSize: 30,
                      textWeight: FontWeight.w600,
                      tittleColor: const Color(0xFF22262F),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 52,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF8595AB)),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.transparent,
                          ),
                          child: Image.asset("assets/images/flag.png"),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.numberController,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: formFieldDeocration(
                                hintText: "Enter Mobile no."),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    controller.generatingOTP.value == true
                        ? const LoadingIndicator()
                        : SubmitButton(
                            tittle: "Continue",
                            onTap: () {
                              controller.generateOtp();
                            },
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
