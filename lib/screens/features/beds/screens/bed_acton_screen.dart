import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/resources/app_text_size.dart';
import '../../../../../core/resources/form_container_decoraion.dart';
import '../../../../../core/resources/screen_size.dart';
import '../../../../../core/resources/textFormField_decoraion.dart';
import '../../../../../core/widgets/buttons/submit_btn.dart';
import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../core/widgets/loading_indecator.dart';
import '../controller/bed_action_controller.dart';
import 'beds_screen.dart';

class BedActionScreen extends StatelessWidget {
  const BedActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BedActionController());
    return Obx(
      () => Scaffold(
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
            "Bed Action",
            style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              //^ PHRN
              H2Text(
                tittle: "PHRN",
                tittleColor: const Color(0xFF212121),
              ),
              10.kH,
              Container(
                height: 55,
                width: ScreenSize.width(context),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: formContainerDecoration(),
                child: TextFormField(
                  controller: controller.phrnController,
                  style: GoogleFonts.outfit(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF22262F),
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              10.kH,
              //^ Patient Name
              H2Text(
                tittle: "Patient Name",
                tittleColor: const Color(0xFF212121),
              ),
              10.kH,
              Container(
                height: 55,
                width: ScreenSize.width(context),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: formContainerDecoration(),
                child: TextFormField(
                  controller: controller.patientNameController,
                  style: GoogleFonts.outfit(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF22262F),
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              10.kH,
              //^ Service Center
              H2Text(
                tittle: "Service Center",
                tittleColor: const Color(0xFF212121),
              ),
              10.kH,

              Container(
                height: 55,
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                decoration: formContainerDecoration(
                  bgcolor: Colors.grey.shade300,
                ),
                child: Text(
                  BedsScreen.selectedBedInfo!.serviceCenter ?? "-",
                  style: GoogleFonts.outfit(
                    fontSize: AppTextSize.h2Textsize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF22262F),
                  ),
                ),
              ),

              10.kH,
              //^ Bed No.
              H2Text(
                tittle: "Bed No.",
                tittleColor: const Color(0xFF212121),
              ),
              10.kH,

              Container(
                height: 55,
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                decoration: formContainerDecoration(
                  bgcolor: Colors.grey.shade300,
                ),
                child: Text(
                  BedsScreen.selectedBedInfo!.bedNo ?? "-",
                  style: GoogleFonts.outfit(
                    fontSize: AppTextSize.h2Textsize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF22262F),
                  ),
                ),
              ),

              10.kH,
              //^ Doctor Name
              H2Text(
                tittle: "Doctor Name",
                tittleColor: const Color(0xFF212121),
              ),
              10.kH,
              Container(
                height: 55,
                width: ScreenSize.width(context),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: formContainerDecoration(),
                child: TextFormField(
                  controller: controller.doctorNameController,
                  style: GoogleFonts.outfit(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF22262F),
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              10.kH,
              //^ Mark Bed
              H2Text(
                tittle: "Mark Bed",
                tittleColor: const Color(0xFF212121),
              ),
              10.kH,

              //^ Mark Bed type
              Obx(
                () => Container(
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                  decoration: formContainerDecoration(),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      offset: const Offset(0, -15),
                      // hint: const Text("All"),
                      value: controller.selectedmarkBedId.value == ""
                          ? null
                          : controller.selectedmarkBedId.value,
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

                      items: controller.markBedTypes.map(
                        (e) {
                          return DropdownMenuItem(
                            value: e.id.toString(),
                            onTap: () =>
                                controller.selectedmarkBedName.value = e.name!,
                            child: Text(
                              e.name.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ).toList(),
                      // Define the onChanged callback

                      onChanged: (String? value) {
                        controller.markBedSelected(value!);
                      },
                    ),
                  ),
                ),
              ),
              10.kH,

              //^ Date
              H2Text(
                tittle: "Date",
                tittleColor: const Color(0xFF212121),
              ),
              10.kH,
              InkWell(
                onTap: () {
                  // controller.pickIncedentDate();
                  controller.selectingOnSiteDate();
                },
                child: Container(
                  height: 55,
                  width: ScreenSize.width(context),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
              //^Remarks
              H2Text(
                tittle: "Remarks",
                tittleColor: const Color(0xFF212121),
              ),
              10.kH,

              TextFormField(
                controller: controller.remarkController,
                maxLines: 3, // Maximum number of visible lines
                minLines: 1, // Minimum number of visible lines,
                style: GoogleFonts.outfit(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF22262F),
                ),

                decoration: formFieldDeocration(
                  hintText: "Type",
                  contentPaddingg:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 11),
                ),
              ),
              20.kH,
              controller.savingBedAction.value == true
                  ? const LoadingIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // 10.kH,
                        SubmitButton(
                          width: ScreenSize.width(context) / 2.25,
                          backgroundColor: const Color(0xFFE3EAFC),
                          textColor: const Color(0xFF5151D6),
                          tittle: "Cancel",
                          onTap: () {
                            Get.back();
                          },
                        ),
                        SubmitButton(
                          width: ScreenSize.width(context) / 2.25,
                          tittle: "Save",
                          onTap: () {
                            controller.saveBed();
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
