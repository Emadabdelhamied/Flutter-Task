import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_quary_values.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: MediaQueryValues(context).width,
      color: white,
      child: Row(children: [
        Container(
            height: 40.h,
            width: 180.w,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                  topLeft: Radius.circular(80),
                  bottomLeft: Radius.circular(80),
                ),
                color: red),
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 3,
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                    color: white,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Emad Abd El-Hamied',
                    style: TextStyles.textViewBold12.copyWith(color: white),
                  )
                ],
              ),
            )),
        const Spacer(),
        CircleAvatar(
          backgroundColor: lightGrey.withOpacity(0.7),
          radius: 30.h,
        ),
      ]),
    );
  }
}
