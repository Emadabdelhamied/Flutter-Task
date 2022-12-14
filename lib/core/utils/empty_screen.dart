import 'package:easy_localization/easy_localization.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: EmptyWidget(
            //image: emptyImage,
            packageImage: PackageImage.Image_4,
            title: tr('empty_title'),
            subTitle: tr('empty_sub'),
            titleTextStyle: const TextStyle(
              fontSize: 22,
              color: Color(0xff9da9c7),
              fontWeight: FontWeight.w500,
            ),
            subtitleTextStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xffabb8d6),
            ),
          ),
        ),
      ),
    );
  }
}
