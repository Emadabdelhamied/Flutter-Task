import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.address,
  });

  int id;
  String title;
  double price;
  String description;
  String image;
  String address;

  @override
  List<Object?> get props => [id, title, price, description, image, address];
}
