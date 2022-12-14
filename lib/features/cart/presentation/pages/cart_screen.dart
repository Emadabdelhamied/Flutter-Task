import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/empty_screen.dart';
import '../../../home/presentation/widgets/home_appbar.dart';
import '../cubit/cart_controller.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarHome(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cart',
                      style: TextStyles.textViewBold20
                          .copyWith(color: Colors.black54),
                    ),
                    controller.productMap.isNotEmpty
                        ? TextButton(
                            onPressed: () {
                              controller.clearCart();
                            },
                            child: Text(
                              'Clear Cart',
                              style: TextStyles.textViewBold18
                                  .copyWith(color: red),
                            ))
                        : const SizedBox()
                  ],
                ),
                controller.productMap.isNotEmpty
                    ? SizedBox(
                        height: controller.productMap.length * 120.h,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.productMap.length,
                          itemBuilder: (context, index) => CartItem(
                            product: controller.productMap.keys.toList()[index],
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 500.h,
                        child: const EmptyScreen(),
                      )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
