// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../resources/app_text_size.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';
import 'text_container.dart';

class SeachField1 extends StatelessWidget {
  const SeachField1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      // padding: EdgeInsets.only(
      //     left: Dimensions.containerPadding - 5,
      //     right: Dimensions.containerPadding - 5),
      decoration: BoxDecoration(
        color: AppColor.searchPatientContainerColor,
        borderRadius:
            BorderRadius.circular(Dimensions.textFieldContainerRadius),
        border: Border.all(color: AppColor.splashColor),
      ),
      width: double.infinity,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   "assets/icons/search.svg",
          //   height: 16.w,
          //   width: 16.w,
          // ),
          // SizedBox(
          //   width: 5.w,
          // ),
          Expanded(
            child:
                // TextFormField(
                //   cursorWidth: 2,
                //   cursorColor: AppColor.hintTextColor,
                //   decoration: InputDecoration(
                //     contentPadding: EdgeInsets.zero,
                //     prefixIcon: IconButton(
                //       onPressed: () {},
                //       icon: SvgPicture.asset(
                //         "assets/icons/search.svg",
                //         height: 16.w,
                //         width: 16.w,
                //       ),
                //     ),
                //     enabledBorder: const OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.transparent),
                //     ),
                //     focusedBorder: const OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.transparent),
                //     ),
                // hintText: Strings.searchPatientHintText,
                //     hintStyle: GoogleFonts.poppins(
                //       fontSize: AppTextSize.body1TextSize,
                //       fontWeight: FontWeight.w400,
                //       color: AppColor.hintTextColor,
                //     ),
                //   ),
                // ),

                TextContainer(
              textWidget: Body1Text(
                tittle: Strings.searchPatientHintText,
                tittleColor: const Color(0xFF597173),
              ),
            ),
          )
        ],
      ),
    );
  }
}
