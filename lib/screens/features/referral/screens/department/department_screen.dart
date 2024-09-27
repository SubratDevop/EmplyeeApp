import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/form_container_decoraion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/resources/app_text_size.dart';
import '../../../../../core/resources/screen_size.dart';
import '../../../../../core/utils/convert_grievanec_datetime.dart';
import '../../../../../core/utils/status_color_generator.dart';
import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../../core/widgets/shimmer_list.dart';
import 'controller/department_controller.dart';

class Department extends StatelessWidget {
  const Department({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepartmentController>(
        init: DepartmentController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
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
                        value: controller.selectedDepartmentId.value == ""
                            ? null
                            : controller.selectedDepartmentId.value,
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

                        items: controller.departmentTypes.map(
                          (e) {
                            return DropdownMenuItem(
                              value: e.lookupId.toString(),
                              onTap: () => controller
                                  .selectedDepartmentName.value = e.lookupName!,
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
                    child: controller.loadingDepartment.value == true
                        ? const ShimmerLIst()
                        : controller.departmentList.isEmpty
                            ? const Center(
                                child: Text("No Data found"),
                              )
                            : ListView.separated(
                                padding: EdgeInsets.zero,
                                separatorBuilder: (_, __) => const Divider(
                                  height: 12,
                                  color: Colors.transparent,
                                ),
                                itemCount: controller.departmentList.length,
                                itemBuilder: (context, index) {
                                  var item = controller.departmentList[index];
                                  return Container(
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
                                        //////////////////////~
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 6,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                      color: statusColorGenrator(
                                                          status:
                                                              item.referralPriority ??
                                                                  "-"),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Text(
                                                    item.referralPriority ?? "",
                                                    style: GoogleFonts.outfit(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: item.referralPriority ==
                                                                "Routine"
                                                            ? statusColorGenrator(
                                                                status:
                                                                    "RoutineText")
                                                            : item.referralPriority ==
                                                                    "Emergency"
                                                                ? statusColorGenrator(
                                                                    status:
                                                                        "EmergencyText")
                                                                : statusColorGenrator(
                                                                    status:
                                                                        "")),
                                                  ),
                                                ),
                                                07.kW,
                                                Text(
                                                  convertDateTime(
                                                      dateTime: item
                                                          .creationTimeStamp!),
                                                  style: GoogleFonts.outfit(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFF516078)),
                                                ),
                                              ],
                                            ),
                                            // Container(
                                            //   padding:
                                            //       const EdgeInsets.symmetric(
                                            //           horizontal: 6,
                                            //           vertical: 2),
                                            //   decoration: BoxDecoration(
                                            //       color:
                                            //           const Color(0xFF5151D6),
                                            //       borderRadius:
                                            //           BorderRadius.circular(4)),
                                            //   child: Text(
                                            //     "Accept",
                                            //     style: GoogleFonts.outfit(
                                            //         fontSize: 12,
                                            //         color: Colors.white,
                                            //         fontWeight:
                                            //             FontWeight.w500),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        05.kH,
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/patientt.svg'),
                                            5.kW,
                                            H2Text(
                                              tittle: item.patientName ?? "",
                                              textWeight: FontWeight.w400,
                                              textSize: 14,
                                              tittleColor:
                                                  const Color(0xFF22262F),
                                            ),
                                          ],
                                        ),
                                        2.kH,
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/patientt.svg',
                                              color: Colors.transparent,
                                            ),
                                            5.kW,
                                            Expanded(
                                              child: H2Text(
                                                tittle: item.remarks ?? "-",
                                                maxTextlines: 2,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textSize:
                                                    AppTextSize.h2Textsize - 4,
                                                tittleColor:
                                                    const Color(0xFF516078),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
