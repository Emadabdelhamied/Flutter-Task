import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/empty_screen.dart';
import '../../../home/presentation/cubit/home_controller.dart';
import '../../../home/presentation/widgets/product_widget.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Favorites',
            style: TextStyles.textViewBold23.copyWith(color: Colors.black),
          ),
        ),
        body: controller.favoriteList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: controller.favoriteList.length,
                  itemBuilder: (context, index) => ProductWidget(
                    product: controller.favoriteList[index],
                  ),
                ),
              )
            : const EmptyScreen(),
      ),
    );
  }
}
