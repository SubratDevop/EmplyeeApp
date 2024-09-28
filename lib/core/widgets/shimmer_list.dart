import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/screen_size.dart';

class ShimmerLIst extends StatelessWidget {
  const ShimmerLIst({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const Divider(
        height: 05,
        color: Colors.transparent,
      ),
      itemCount: 50,
      itemBuilder: (context, index) {
        // var h2text = H2Text;
        return 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: ScreenSize.width(context),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFECEEF2).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(05)),
                    ),
                    10.kH,
                    Container(
                      height: 20,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(05)),
                    ),
                    10.kH,
                    Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(05)),
                    ),
                  ],
                ),
              )),
        );
     
      },
    );
  }
}

class BedShimmerLIst extends StatelessWidget {
  const BedShimmerLIst({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // childAspectRatio: ,
        // crossAxisCount: 4,
        crossAxisCount: 5,
        // crossAxisSpacing: 30,
        // mainAxisSpacing: 14
      ),
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/icons/beds.png",
                    // fit: BoxFit.cover,
                    color: Colors.green),
              ),
              04.kH,
              Container(
                height: 09,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(02)),
              )
            ],
          ),
        );
      },
    );
  }
}
