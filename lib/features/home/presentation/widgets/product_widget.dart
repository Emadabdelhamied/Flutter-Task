import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';
import '../../../cart/domain/entities/product_entity.dart';
import '../../../cart/presentation/cubit/cart_controller.dart';
import 'favorite_button.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity product;
  ProductWidget({super.key, required this.product});
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 250.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                      color: Color(int.parse(product.image)),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Positioned(
                    child: FavoriteIcon(
                  id: product.id,
                )),
                Positioned(
                    bottom: -5,
                    left: -10,
                    child: IconButton(
                        onPressed: () {
                          cartController.addProductToCart(product);
                          log(cartController.productMap.toString());
                        },
                        icon: Container(
                          height: 30.h,
                          width: 30.h,
                          decoration: BoxDecoration(
                              color: lightGrey.withOpacity(0.3),
                              shape: BoxShape.circle),
                          child: const Icon(Icons.shopping_cart_outlined,
                              size: 20),
                        ))),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.title,
                  style:
                      TextStyles.textViewBold15.copyWith(color: Colors.black),
                ),
                Text(
                  product.description,
                  style: TextStyles.textViewMedium13.copyWith(color: lightGrey),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 15,
                    ),
                    Text(
                      product.address,
                      style: TextStyles.textViewMedium13
                          .copyWith(color: lightGrey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: TextStyles.textViewBold12.copyWith(color: red),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      '\$${product.price}',
                      style:
                          TextStyles.textViewBold12.copyWith(color: lightGrey),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
