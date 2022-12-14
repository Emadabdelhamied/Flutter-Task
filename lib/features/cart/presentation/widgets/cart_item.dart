import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';
import '../../domain/entities/product_entity.dart';
import '../cubit/cart_controller.dart';

class CartItem extends StatelessWidget {
  final ProductEntity product;
  CartItem({super.key, required this.product});
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: BoxDecoration(
                color: Color(int.parse(product.image)),
                //color: red,
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
                product.title,
                style: TextStyles.textViewBold15.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                product.description,
                style: TextStyles.textViewMedium13.copyWith(color: lightGrey),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                '\$${product.price}',
                style: TextStyles.textViewBold12.copyWith(color: red),
              )
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          SizedBox(
            width: 120.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.removeProductsFromCart(product);
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.blue.shade100),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Obx(() => Text(controller.productMap[product].toString())),
                InkWell(
                  onTap: () {
                    controller.addProductToCart(product);
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.blue.shade100),
                    child: const Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
