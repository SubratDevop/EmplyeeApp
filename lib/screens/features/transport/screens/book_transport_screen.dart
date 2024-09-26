import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_text_size.dart';
import '../../../../core/resources/colors.dart';
import '../../../../core/resources/form_container_decoraion.dart';
import '../../../../core/resources/textFormField_decoraion.dart';
import '../../../../core/widgets/buttons/submit_btn.dart';
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

                        GetBuilder<BookTransportController>(
                            init: BookTransportController(),
                            builder: (controller) {
                              return InkWell(
                                onTap: () {
                                  // controller.pickUpDialog();
                                  showDialog(
                                    context: Get.context!,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        title: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                H2Text(
                                                  tittle: "Pickup Location",
                                                  textSize:
                                                      AppTextSize.h2Textsize,
                                                  textWeight: FontWeight.w600,
                                                  tittleColor:
                                                      const Color(0xFF22262F),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.zero,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: AppColor
                                                              .curvedContainerColor
                                                              .withOpacity(
                                                                  0.5))),
                                                  child: TextButton.icon(
                                                      label: H2Text(
                                                        tittle: "Home",
                                                        textSize: AppTextSize
                                                            .h2Textsize,
                                                        textWeight:
                                                            FontWeight.w600,
                                                        tittleColor: AppColor
                                                            .curvedContainerColor,
                                                      ),
                                                      onPressed: () {
                                                        controller
                                                                .pickupController
                                                                .text =
                                                            controller.home;
                                                        controller.update();
                                                      },
                                                      icon: SvgPicture.asset(
                                                        "assets/icons/home.svg",
                                                        color: AppColor
                                                            .curvedContainerColor,
                                                      )),
                                                )
                                              ],
                                            ),
                                            1.kH,
                                            const Divider(
                                              color: Color(0xFFD5DAE2),
                                              thickness: 1.5,
                                            ),
                                            1.kH,
                                            TextFormField(
                                                controller:
                                                    controller.pickupController,
                                                maxLines: 4,
                                                minLines: 1,
                                                style: GoogleFonts.outfit(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF22262F),
                                                ),
                                                decoration: formFieldDeocration(
                                                    hintText: "Enter location"))
                                          ],
                                        ),
                                        // content: ,
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              controller.pickupController.text =
                                                  "";
                                              controller.update();
                                              Get.back();
                                            },
                                            child: H2Text(
                                              tittle: "Cancel",
                                              textSize: AppTextSize.h2Textsize,
                                              textWeight: FontWeight.w600,
                                              tittleColor:
                                                  const Color(0xFF597173),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              controller.update();
                                              Get.back();
                                            },
                                            child: H2Text(
                                              tittle: "Confirm",
                                              textSize: AppTextSize.h2Textsize,
                                              textWeight: FontWeight.w600,
                                              tittleColor:
                                                  AppColor.primaryColor,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: formContainerDecoration(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/location.svg'),
                                          5.kW,
                                          H2Text(
                                            tittle: "Pickup Location",
                                            textSize:
                                                AppTextSize.h2Textsize - 3,
                                            textWeight: FontWeight.w600,
                                            tittleColor:
                                                const Color(0xFF22262F),
                                          ),
                                        ],
                                      ),
                                      2.kH,
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/location.svg',
                                            color: Colors.transparent,
                                          ),
                                          5.kW,
                                          Expanded(
                                            child: H2Text(
                                              tittle: controller
                                                  .pickupController.text,
                                              maxTextlines: 2,
                                              // textWeight: FontWeight.w700,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              textSize:
                                                  AppTextSize.h2Textsize - 3,
                                              tittleColor:
                                                  const Color(0xFF516078),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        //^ Drop Location
                        8.kH,
                        GetBuilder<BookTransportController>(
                            init: BookTransportController(),
                            builder: (controller) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                    context: Get.context!,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        title: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                H2Text(
                                                  tittle: "Drop Location",
                                                  textSize:
                                                      AppTextSize.h2Textsize,
                                                  textWeight: FontWeight.w600,
                                                  tittleColor:
                                                      const Color(0xFF22262F),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.zero,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: AppColor
                                                              .curvedContainerColor
                                                              .withOpacity(
                                                                  0.5))),
                                                  child: TextButton.icon(
                                                      label: H2Text(
                                                        tittle: "Home",
                                                        textSize: AppTextSize
                                                            .h2Textsize,
                                                        textWeight:
                                                            FontWeight.w600,
                                                        tittleColor: AppColor
                                                            .curvedContainerColor,
                                                      ),
                                                      onPressed: () {
                                                        controller
                                                                .dropController
                                                                .text =
                                                            controller.home;
                                                        controller.update();
                                                      },
                                                      icon: SvgPicture.asset(
                                                        "assets/icons/home.svg",
                                                        color: AppColor
                                                            .curvedContainerColor,
                                                      )),
                                                )
                                              ],
                                            ),
                                            1.kH,
                                            const Divider(
                                              color: Color(0xFFD5DAE2),
                                              thickness: 1.5,
                                            ),
                                            1.kH,
                                            TextFormField(
                                                controller:
                                                    controller.dropController,
                                                maxLines: 4,
                                                minLines: 1,
                                                style: GoogleFonts.outfit(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF22262F),
                                                ),
                                                decoration: formFieldDeocration(
                                                    hintText: "Enter location"))
                                          ],
                                        ),
                                        // content: ,
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              controller.dropController.text =
                                                  "";
                                              controller.update();
                                              Get.back();
                                            },
                                            child: H2Text(
                                              tittle: "Cancel",
                                              textSize: AppTextSize.h2Textsize,
                                              textWeight: FontWeight.w600,
                                              tittleColor:
                                                  const Color(0xFF597173),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              controller.update();
                                              Get.back();
                                            },
                                            child: H2Text(
                                              tittle: "Confirm",
                                              textSize: AppTextSize.h2Textsize,
                                              textWeight: FontWeight.w600,
                                              tittleColor:
                                                  AppColor.primaryColor,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: formContainerDecoration(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/location.svg'),
                                          5.kW,
                                          H2Text(
                                            tittle: "Drop Location",
                                            textSize:
                                                AppTextSize.h2Textsize - 3,
                                            textWeight: FontWeight.w600,
                                            tittleColor:
                                                const Color(0xFF22262F),
                                          ),
                                        ],
                                      ),
                                      2.kH,
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/location.svg',
                                            color: Colors.transparent,
                                          ),
                                          5.kW,
                                          Expanded(
                                            child: H2Text(
                                              tittle: controller
                                                  .dropController.text,
                                              maxTextlines: 2,
                                              // textWeight: FontWeight.w700,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              textSize:
                                                  AppTextSize.h2Textsize - 3,
                                              tittleColor:
                                                  const Color(0xFF516078),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
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
