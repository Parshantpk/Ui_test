import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GetShimmer extends StatelessWidget {
  const GetShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: const Color(0xFFE0E0E0),
        highlightColor: const Color(0xFFE0E0E0).withOpacity(0.0),
        child: Container(
          height: 94.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
