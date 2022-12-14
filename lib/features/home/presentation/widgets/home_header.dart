import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Explore By Category',
          style: TextStyles.textViewBold16.copyWith(color: Colors.black),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'See All',
              style: TextStyles.textViewBold16.copyWith(color: lightGrey),
            ))
      ],
    );
  }
}
