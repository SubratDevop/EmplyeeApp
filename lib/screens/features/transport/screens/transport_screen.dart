import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_text_size.dart';
import '../../../../core/resources/colors.dart';
import '../../../../core/resources/screen_size.dart';
import '../../../../core/utils/convert_grievanec_datetime.dart';
import '../../../../core/utils/status_color_generator.dart';
import '../controller/transport_controller.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranspostController>(
        init: TranspostController(),
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
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.getTransportList();
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
                centerTitle: false,
                title: Text(
                  "Transport Service",
                  style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: controller.transportList.isEmpty
                    ? const Center(
                        child: Text("No Data found"),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.zero,
                        separatorBuilder: (_, __) => const Divider(
                          height: 12,
                          color: Colors.transparent,
                        ),
                        itemCount: controller.transportList.length,
                        itemBuilder: (context, index) {
                          var item = controller.transportList[index];
                          return Container(
                            // height: 125,
                            width: ScreenSize.width(context),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECEEF2).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //^ Scheduled Pickup
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      convertGrievanecDateTime(
                                          dateTime: item.creationTimeStamp!),
                                      style: GoogleFonts.outfit(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF516078)),
                                    ),
                                    Text(
                                      item.status ?? "-",
                                      style: GoogleFonts.outfit(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: statusColorGenrator(
                                              status: item.status ?? "-")),
                                    )
                                  ],
                                ),
                                4.kH,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/location.svg'),
                                        5.kW,
                                        H2Text(
                                          tittle: "Scheduled Pickup",
                                          textWeight: FontWeight.w600,
                                          tittleColor: const Color(0xFF22262F),
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
                                        H2Text(
                                          tittle: item.pickupLocation ?? "-",
                                          maxTextlines: 2,
                                          // textWeight: FontWeight.w400,
                                          textOverflow: TextOverflow.ellipsis,
                                          textSize: AppTextSize.h2Textsize - 4,
                                          tittleColor: const Color(0xFF516078),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //^ Drop Location
                                4.kH,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/location.svg'),
                                        5.kW,
                                        H2Text(
                                          tittle: "Drop Location",
                                          textWeight: FontWeight.w600,
                                          tittleColor: const Color(0xFF22262F),
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
                                        H2Text(
                                          tittle: item.dropLocation ?? "-",
                                          maxTextlines: 2,
                                          // textWeight: FontWeight.w400,
                                          textOverflow: TextOverflow.ellipsis,
                                          textSize: AppTextSize.h2Textsize - 4,
                                          tittleColor: const Color(0xFF516078),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed('/NewGrevanceScreen');
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: H3Text(
                  tittle: "New Request",
                  tittleColor: Colors.white,
                  textSize: 18,
                ),
              ));
        });
  }
}
