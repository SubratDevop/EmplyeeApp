import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_text_size.dart';
import '../../../../core/resources/colors.dart';
import '../../../../core/resources/form_container_decoraion.dart';
import '../../../../core/widgets/buttons/submit_btn.dart';
import '../../../../core/widgets/custom_dropdown.dart';
import '../../../../core/widgets/loading_indecator.dart';
import '../controller/book_transport_controller.dart';

class BookTrnsportScreen extends StatelessWidget {
  const BookTrnsportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookTransportController());
    return Obx(
      () => Scaffold(
        // backgroundColor: Colors.white,
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
            "Transport Request",
            style: GoogleFonts.outfit(
                fontSize: 22,
                // fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1),
          ),
        ),
        body: Container(
          height: ScreenSize.height(context),
          width: ScreenSize.width(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/map.png"), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenSize.height(context) / 4,
                width: ScreenSize.width(context),
              ),
              Expanded(
                child: Container(
                  // height: double.infinity,
                  width: ScreenSize.width(context),
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        H2Text(
                          tittle: "Book your transport",
                          textWeight: FontWeight.w600,
                          tittleColor: const Color(0xFF22262F),
                        ),
                        1.kH,
                        const Divider(
                          color: Color(0xFFD5DAE2),
                          thickness: 1.5,
                        ),
                        1.kH,
                        //^ Pickup Location
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 12),
                          decoration: formContainerDecoration(),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              offset: const Offset(0, -15),
                              hint: Text(
                                "Pickup Location",
                                style: TextStyle(
                                    fontSize: AppTextSize.h2Textsize - 2,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF22262F)),
                              ),

                              value:
                                  controller.selectedPickupLocation.value == ""
                                      ? null
                                      : controller.selectedPickupLocation.value,
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

                              items: controller.pickupLocations.map(
                                (e) {
                                  return DropdownMenuItem(
                                    value: e.toString(),
                                    child: Text(
                                      e.toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                },
                              ).toList(),
                              // Define the onChanged callback

                              onChanged: (String? value) {
                                controller.pickupLocationSelected(value!);
                              },
                            ),
                          ),
                        ),

                        //^ Drop Location
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
                              hint: Text(
                                "Drop Location",
                                style: TextStyle(
                                    fontSize: AppTextSize.h2Textsize - 2,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF22262F)),
                              ),

                              value: controller.selectedDropLocation.value == ""
                                  ? null
                                  : controller.selectedDropLocation.value,
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

                              items: controller.dropLocations.map(
                                (e) {
                                  return DropdownMenuItem(
                                    value: e.toString(),
                                    child: Text(
                                      e.toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                },
                              ).toList(),
                              // Define the onChanged callback

                              onChanged: (String? value) {
                                controller.dropLocationSelected(value!);
                              },
                            ),
                          ),
                        ),

                        7.kH,
                        H2Text(
                          tittle: "Pick Date and Time",
                          textSize: AppTextSize.h2Textsize - 3,
                          textWeight: FontWeight.w600,
                          tittleColor: const Color(0xFF22262F),
                        ),
                        7.kH,
                        InkWell(
                          onTap: () {
                            // controller.pickIncedentDate();
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
                                    tittle:
                                        controller.selectOnSiteDate.value == ""
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

                        20.kH,
                        controller.savingTransport.value == true
                            ? const LoadingIndicator()
                            : SubmitButton(
                                tittle: "Book Transport",
                                onTap: () {
                                  controller.saveTransport();
                                },
                              )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
