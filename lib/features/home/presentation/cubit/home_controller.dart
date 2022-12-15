import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../cart/data/models/product_model.dart';

class HomeController extends GetxController {
  List<ProductModel> favoriteList = <ProductModel>[].obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = storage.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
  }

  List<ProductModel> products = [
    ProductModel(
        id: 1,
        title: 'product 1',
        price: 12,
        description: 'Product 1 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
    ProductModel(
        id: 2,
        title: 'product 2',
        price: 102,
        description: 'Product 2 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
    ProductModel(
        id: 3,
        title: 'product 3',
        price: 192,
        description: 'Product 3 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
    ProductModel(
        id: 4,
        title: 'product 4',
        price: 102,
        description: 'Product 4 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
    ProductModel(
        id: 5,
        title: 'product 5',
        price: 152,
        description: 'Product 5 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
    ProductModel(
        id: 6,
        title: 'product 6',
        price: 132,
        description: 'Product 6 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
    ProductModel(
        id: 7,
        title: 'product 7',
        price: 121,
        description: 'Product 7 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
    ProductModel(
        id: 8,
        title: 'product 8',
        price: 124,
        description: 'Product 8 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
    ProductModel(
        id: 9,
        title: 'product 9',
        price: 122,
        description: 'Product 9 description',
        image: '0xFFF7BEC0',
        address: 'Mansoura'),
  ].obs;
  void addToFavorites(int productId) async {
    var existingIndex =
        favoriteList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoriteList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      favoriteList
          .add(products.firstWhere((element) => element.id == productId));
      var list = favoriteList.map((e) => e.toJson()).toList();
      await storage.write("isFavouritesList", list);
    }
  }

  bool isFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }
}
