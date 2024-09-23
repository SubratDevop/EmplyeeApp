// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../responsive/responsive_size.dart';

class GridViewWideContainerShimmer extends StatelessWidget {
  const GridViewWideContainerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisExtent: 50,
          crossAxisCount: Responsive.isMobile(context)
              ? 2
              : Responsive.isMediumMobile(context)
                  ? 2
                  : Responsive.isLargeMobile(context)
                      ? 2
                      : 3),
      // scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (_, __) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 40,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
    );
  }
}
