import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLIst extends StatelessWidget {
  const   ShimmerLIst({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const Divider(
        height: 05,
        color: Colors.transparent,
      ),
      itemCount: 50,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB0E2F1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 16,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 16,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 16,
                            width: 150, // Adjust width according to your design
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        height: 16,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
