import 'package:e_commerce_shopping_app_provider/models/product.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CartModel {
  final String id;
  final ProductModel product;
  int quantity;

  CartModel({
    required this.product,
    required this.quantity,
  }) : id = uuid.v4();
}
