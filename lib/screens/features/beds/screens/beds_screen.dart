import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/utils/status_color_generator.dart';
import 'package:employee_app/core/widgets/shimmer_list.dart';
import 'package:employee_app/screens/features/beds/controller/bed_controller.dart';
import 'package:employee_app/screens/features/beds/model/bed_service_center_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_text_size.dart';
import '../../../../core/resources/colors.dart';
import '../../../../core/resources/form_container_decoraion.dart';
import '../../../../core/resources/screen_size.dart';
import '../../../../core/widgets/custom_dropdown.dart';
import '../widget/bed_stattus_widget.dart';

class BedsScreen extends StatelessWidget {
  const BedsScreen({super.key});

  static BedMasterList? selectedBedInfo;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BedController>(
      init: BedController(),
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
                    // controller.getGrievanceList("", "");
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
            centerTitle: false,
            title: Text(
              "Bed Management",
              style: GoogleFonts.outfit(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 1),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                //^ status List
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: besStatusWidget(
                        tittle: 'Available',
                        statusColor: const Color(0xFF969EB0),
                      ),
                    ),
                    30.kW,
                    Expanded(
                      child: besStatusWidget(
                        tittle: 'Occupied',
                        statusColor: const Color(0xFF29BF80),
                      ),
                    ),
                  ],
                ),
                10.kH,

                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: besStatusWidget(
                        tittle: 'Blocked',
                        statusColor: const Color(0xFFDE972C),
                      ),
                    ),
                    30.kW,
                    Expanded(
                      child: besStatusWidget(
                        tittle: 'Under Maintainance',
                        statusColor: const Color(0xFFF14E63),
                      ),
                    ),
                  ],
                ),
                10.kH,
                Row(
                  children: [
                    SizedBox(
                      // width: 100,
                      child: besStatusWidget(
                        tittle: 'Marked for Discharge',
                        statusColor: const Color(0xFF9F57D7),
                      ),
                    ),
                  ],
                ),
                1.kH,

                const Divider(
                  color: Color(0xFFD5DAE2),
                  thickness: 1.5,
                ),
                15.kH,
                //^ all Bed Status Catagory
                Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                  decoration: formContainerDecoration(),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      offset: const Offset(0, -15),
                      // hint: const Text("All"),
                      value: controller.selectBedServiceCenterId.value == ""
                          ? null
                          : controller.selectBedServiceCenterId.value,
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

                      items: controller.bedTypes.map(
                        (e) {
                          return DropdownMenuItem(
                            value: e.lookupId.toString(),
                            onTap: () => controller.selectBedServiceCenterName
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
                        controller.servceSenterSelected(value!);
                      },
                    ),
                  ),
                ),
                30.kH,
                controller.loadingBeds.value == true
                    ? const BedShimmerLIst()
                    : controller.bedList.isEmpty
                        ? const Center(
                            child: Text("No data found"),
                          )
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: controller.bedList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    // childAspectRatio: ,
                                    // crossAxisCount: 4,
                                    crossAxisCount: 5,
                                    // crossAxisSpacing: 10,
                                    mainAxisSpacing: 14),
                            itemBuilder: (_, index) {
                              var item = controller.bedList[index];
                              return InkWell(
                                onTap: () {
                                  BedsScreen.selectedBedInfo = item;

                                  Get.toNamed('/BedActionScreen');
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        "assets/icons/beds.png",
                                        // fit: BoxFit.cover,
                                        color: statusColorGenrator(
                                            status: item.bedStatus!),
                                      ),
                                    ),
                                    04.kH,
                                    Text(
                                      item.bedNo ?? "-",
                                      style: GoogleFonts.outfit(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF3A4352)),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}
