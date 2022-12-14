import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';
import '../cubit/home_controller.dart';

class FavoriteIcon extends StatefulWidget {
  final int id;
  const FavoriteIcon({super.key, required this.id});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  final controller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: controller.isFavorite(widget.id)
                ? Colors.red
                : const Color(0xffD4D4EA),
            shape: BoxShape.circle),
        child: InkWell(
          onTap: () {
            controller.addToFavorites(widget.id);
          },
          child: controller.isFavorite(widget.id)
              ? const Icon(
                  Icons.favorite,
                  color: white,
                  size: 10,
                )
              : const Icon(
                  Icons.favorite_border,
                  size: 10,
                ),
        ),
      ),
    );
  }
}
