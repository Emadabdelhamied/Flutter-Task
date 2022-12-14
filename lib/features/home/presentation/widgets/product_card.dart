import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Column(
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: BoxDecoration(
                color: red.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(
            width: 15.h,
          ),
          Text(
            'Product',
            style: TextStyles.textViewMedium16.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
