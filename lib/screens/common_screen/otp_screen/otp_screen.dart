import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/app_text_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../login_screen/login_screen.dart';
import 'controller/otp_controller.dart';
import 'model/login_model.dart';

class OtpScreen extends StatelessWidget {
  static EmployeeDetails? employeeInfo;
  OtpScreen({super.key});
  final controller = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H1Text(tittle: "Verify"),
            08.kH,
            H2Text(
              tittle: "Please enter the OTP sent to",
              tittleColor: const Color(0xFF516078),
              textWeight: FontWeight.w400,
              textSize: 20,
            ),
            05.kH,
            Row(
              children: [
                H2Text(
                  tittle: "(+91) ${LoginScreen.userMobileNo}",
                  tittleColor: const Color(0xFF516078),
                  textWeight: FontWeight.w500,
                  textSize: 20,
                ),
              ],
            ),
            30.kH,
            //* Pin
            Pinput(
              length: 6,
              forceErrorState: true,
              pinAnimationType: PinAnimationType.fade,
              keyboardType: TextInputType.number,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                padding: EdgeInsets.zero,
                textStyle:
                    const TextStyle(fontSize: 20, color: Color(0xFF22262F)),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.shade600), // Custom border color
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onCompleted: (value) {
                // Get.toNamed('/HomeScreen');
                controller.generateOtp(otp: value);
              },
            ),
            30.kH,

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     H2Text(
            //       tittle: "Didn’t receive OTP?",
            //       tittleColor: const Color(0xFF516078),
            //       textWeight: FontWeight.w400,
            //       textSize: 20,
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         H2Text(
            //           tittle: "resend in",
            //           tittleColor: const Color(0xFF516078),
            //           textWeight: FontWeight.w400,
            //           textSize: 20,
            //         ),
            //         05.kW,
            //         H2Text(
            //           tittle: "15 sec",
            //           tittleColor: const Color(0xFF22262F),
            //           textWeight: FontWeight.w500,
            //           textSize: 20,
            //         ),
            //       ],
            //     ),
            //     05.kH,
            //     //^ Resend button
            //     Container(
            //       height: 45,
            //       width: 100,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           border: Border.all(color: const Color(0xFF5151D6))),
            //       child: H2Text(
            //         tittle: "Resend",
            //         textWeight: FontWeight.w700,
            //         tittleColor: const Color(0xFF5151D6),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
