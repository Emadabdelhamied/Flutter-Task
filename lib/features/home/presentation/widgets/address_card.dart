import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 250.w,
      decoration: BoxDecoration(
          border: Border.all(color: lightGrey.withOpacity(0.5)),
          color: white,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                  color: red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Home Address',
                  style:
                      TextStyles.textViewBold15.copyWith(color: Colors.black),
                ),
                Text(
                  'Emad Abd El-Hamied',
                  style: TextStyles.textViewMedium13.copyWith(color: lightGrey),
                ),
                Text(
                  'Street 1',
                  style: TextStyles.textViewMedium13.copyWith(color: lightGrey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
