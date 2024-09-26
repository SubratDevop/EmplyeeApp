import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/app_text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/resources/colors.dart';
import '../../../../core/resources/form_container_decoraion.dart';
import '../../../../core/resources/screen_size.dart';
import '../../../../core/resources/textFormField_decoraion.dart';
import '../../../../core/widgets/buttons/submit_btn.dart';
import '../../../../core/widgets/custom_dropdown.dart';
import '../../../../core/widgets/loading_indecator.dart';
import '../controller/new_grievance_controller.dart';

class NewGrevanceScreen extends StatelessWidget {
  const NewGrevanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewGrievanceController>(
        init: NewGrievanceController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: AppColor.curvedContainerColor,
              toolbarHeight: 70,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  height: 30,
                  width: 30,
                ),
              ),
              centerTitle: false,
              title: Text(
                "New Grievance",
                style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    //^ Grievance Category*
                    Row(
                      children: [
                        H2Text(
                          tittle: "Grievance Category",
                          tittleColor: const Color(0xFF212121),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        H2Text(
                          tittle: "*",
                          tittleColor: Colors.red,
                        ),
                      ],
                    ),
                    10.kH,
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 12),
                      decoration: formContainerDecoration(),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          offset: const Offset(0, -15),
                          hint: const Text("All"),
                          value: controller.selectedGrievanceId.value == ""
                              ? null
                              : controller.selectedGrievanceId.value,
                          dropdownMaxHeight: ScreenSize.width(context) / 2,
                          // isDense: true,
                          style: GoogleFonts.outfit(
                            fontSize: AppTextSize.h2Textsize,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF22262F),
                          ),
                          icon: SvgPicture.asset(
                            'assets/icons/arrow_down.svg',
                            height: 10,
                            width: 10,
                          ),

                          items: controller.grievanceTypes.map(
                            (e) {
                              return DropdownMenuItem(
                                value: e.lookupId.toString(),
                                onTap: () => controller.selectedGrievanceName
                                    .value = e.lookupName!,
                                child: Text(
                                  e.lookupName.toString(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            },
                          ).toList(),
                          // Define the onChanged callback

                          onChanged: (String? value) {
                            controller.grievanceSelected(value!);
                          },
                        ),
                      ),
                    ),

                    10.kH,
                    //^Issue Description
                    Row(
                      children: [
                        H2Text(
                          tittle: "Issue Description",
                          tittleColor: const Color(0xFF212121),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        H2Text(
                          tittle: "*",
                          tittleColor: Colors.red,
                        ),
                      ],
                    ),
                    10.kH,

                    TextFormField(
                      controller: controller.descriptionController,
                      maxLines: 3, // Maximum number of visible lines
                      minLines: 1, // Minimum number of visible lines,
                      style: GoogleFonts.outfit(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF22262F),
                      ),
                      decoration: formFieldDeocration(
                        hintText: "Type",
                        contentPaddingg: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 11),
                      ),
                    ),
                    10.kH,
                    //^ Date & Time of Incident
                    Row(
                      children: [
                        H2Text(
                          tittle: "Date & Time of Incident",
                          tittleColor: const Color(0xFF212121),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        H2Text(
                          tittle: "*",
                          tittleColor: Colors.red,
                        ),
                      ],
                    ),

                    10.kH,
                    InkWell(
                      onTap: () {
                        controller.selectingOnSiteDate();
                      },
                      child: Container(
                        height: 55,
                        width: ScreenSize.width(context),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: formContainerDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => H2Text(
                                tittle: controller.selectOnSiteDate.value == ""
                                    ? "-"
                                    : controller.selectOnSiteDate.value,
                                tittleColor: const Color(0xFF22262F),
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/icons/calender.svg",
                              width: 20,
                            )
                            // Pad
                          ],
                        ),
                      ),
                    ),
                    10.kH,
                    //^ People Involved (if any)
                    H2Text(
                      tittle: "People Involved (if any)",
                      tittleColor: const Color(0xFF212121),
                    ),
                    10.kH,
                    Container(
                      height: 55,
                      width: ScreenSize.width(context),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      decoration: formContainerDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.pepoleController,
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.outfit(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF22262F),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/user.svg",
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    30.kH,
                    // //^ Supporting Evidence
                    // H2Text(
                    //   tittle: "Supporting Evidence",
                    //   tittleColor: const Color(0xFF212121),
                    // ),
                    // 10.kH,
                    // Container(
                    //   height: 75,
                    //   decoration: const BoxDecoration(
                    //       // color: Colors.white,
                    //       border: DashedBorder.fromBorderSide(
                    //           dashLength: 10,
                    //           side: BorderSide(color: Color(0xFFBDBDBD), width: 1)),
                    //       borderRadius: BorderRadius.all(Radius.circular(14))),
                    //   child: Center(
                    //       child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       SvgPicture.asset("assets/icons/upload.svg"),
                    //       H2Text(
                    //         tittle: "Browse Files",
                    //         tittleColor: const Color(0xFF4840EE),
                    //       )
                    //     ],
                    //   )),
                    // ),
                    // 20.kH,
                    controller.savingGrievance.value == true
                        ? const LoadingIndicator()
                        : SubmitButton(
                            tittle: "Submit",
                            onTap: () {
                              controller.saveGrivance();
                            },
                          )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
