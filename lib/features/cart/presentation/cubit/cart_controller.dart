import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../domain/entities/product_entity.dart';

class CartController extends GetxController {
  var productMap = {}.obs;
  var storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    var storedShoppings = storage.read('cart');
    if (storedShoppings != null) {
      productMap = storedShoppings;
    }
  }

  void addProductToCart(ProductEntity productModel) async {
    if (productMap.containsKey(productModel)) {
      productMap[productModel] += 1;
      await storage.write('cart', productMap);
    } else {
      productMap[productModel] = 1;
      snackBar(
          title: 'Cart',
          message: 'Product Added to cart',
          color: Colors.green.shade300);
    }
  }

  void removeOneProductFromCart(ProductEntity productModel) async {
    productMap.removeWhere((key, value) => key == productModel);
    await storage.write('cart', productMap);
  }

  void removeProductsFromCart(ProductEntity productModel) async {
    if (productMap.containsKey(productModel) && productMap[productModel] == 1) {
      productMap.removeWhere((key, value) => key == productModel);
      await storage.write('cart', productMap);
    } else {
      productMap[productModel] -= 1;
      await storage.write('cart', productMap);
    }
  }

  void clearCart() {
    if (productMap.isNotEmpty) {
      Get.defaultDialog(
          title: 'Clear Cart !',
          middleText: 'Are you sure you want to remove all items?',
          textCancel: 'Cancel',
          cancelTextColor: Colors.black,
          confirmTextColor: Colors.white,
          textConfirm: 'Ok',
          buttonColor: Colors.red.shade500,
          backgroundColor: Colors.white.withOpacity(0.7),
          onCancel: () {
            Get.back();
          },
          onConfirm: () {
            productMap.clear();
            Get.back();
          });
    } else {
      snackBar(title: 'Cart', message: 'your Cart is empty');
      storage.remove('cart');
    }
  }

  get productSubTotal => productMap.entries
      .map((element) => element.key.price * element.value)
      .toList();

  get productsTotalPrice => productMap.isNotEmpty
      ? productMap.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2)
      : 0.00;

  int quantity() => productMap.isNotEmpty
      ? productMap.entries
          .map((element) => element.value)
          .toList()
          .reduce((value, element) => value + element)
      : 0;
}

void snackBar(
        {required String title,
        required String message,
        Color color = Colors.red}) =>
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP, backgroundColor: color);
