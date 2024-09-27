import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/app_text_size.dart';
import 'package:employee_app/core/widgets/shimmer_list.dart';
import 'package:employee_app/screens/features/grievance/controller/grievance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/colors.dart';
import '../../../../core/resources/form_container_decoraion.dart';
import '../../../../core/resources/screen_size.dart';
import '../../../../core/utils/convert_grievanec_datetime.dart';
import '../../../../core/utils/status_color_generator.dart';
import '../../../../core/widgets/custom_dropdown.dart';

class GrievanceScreen extends StatelessWidget {
  const GrievanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GrievanceController>(
        init: GrievanceController(),
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
                        controller.getGrievanceList("", "");
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
                centerTitle: false,
                title: Text(
                  "Grievance Cell",
                  style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
              ),
             
              body:
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //^ all Grievance Catagory
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 12),
                      decoration: formContainerDecoration(),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          offset: const Offset(0, -15),
                          // hint: const Text("All"),
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
                    13.kH,

                    Expanded(
                      child: controller.loadingGrivance.value == true
                          ? const ShimmerLIst()
                          : controller.grievanceList.isEmpty
                              ? const Center(
                                  child: Text("No Data found"),
                                )
                              : ListView.separated(
                                  padding: EdgeInsets.zero,
                                  separatorBuilder: (_, __) => const Divider(
                                    height: 12,
                                    color: Colors.transparent,
                                  ),
                                  itemCount: controller.grievanceList.length,
                                  itemBuilder: (context, index) {
                                    var item = controller.grievanceList[index];
                                    return Container(
                                      height: 125,
                                      width: ScreenSize.width(context),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFECEEF2)
                                            .withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                convertDateTime(
                                                    dateTime: item
                                                        .creationTimeStamp!),
                                                style: GoogleFonts.outfit(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFF516078)),
                                              ),
                                              Text(
                                                item.status ?? "-",
                                                style: GoogleFonts.outfit(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: statusColorGenrator(
                                                        status: item.status ??
                                                            "-")),
                                              )
                                            ],
                                          ),
                                          2.kH,
                                          H2Text(
                                            tittle: item.grievanceType ?? "-",
                                          ),
                                          2.kH,
                                          H2Text(
                                            tittle:
                                                item.issueDescription ?? "-",
                                            maxTextlines: 2,
                                            textOverflow: TextOverflow.ellipsis,
                                            textSize:
                                                AppTextSize.h2Textsize - 4,
                                            tittleColor:
                                                const Color(0xFF516078),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                    ),
                  ],
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
                  tittle: "New Grievance",
                  tittleColor: Colors.white,
                  textSize: 18,
                ),
              ));
        });
  }
}
