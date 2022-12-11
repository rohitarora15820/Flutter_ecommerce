import 'package:hive_flutter/hive_flutter.dart';

import '../../models/models.dart';

abstract class BaseLocalStorage {
  Future<Box> openBox();
  List<Product> getWishList(Box box);
  Future<void> adddProductToWishList(Box box, Product product);
  Future<void> removeProductFromWishList(Box box, Product product);
  Future<void> clearWishList(Box box);
}
