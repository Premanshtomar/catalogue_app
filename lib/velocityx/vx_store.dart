import 'package:catalogue_app/models/cart.dart';
import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/velocityx/auth_state.dart';
import 'package:velocity_x/velocity_x.dart';

class MyVxStore extends VxStore{
  CatalogueModel catalog = CatalogueModel();
  late CartModel cart = CartModel(catalog);
  AuthState authState = AuthState();

  MyVxStore() {
    catalog = CatalogueModel();
    cart = CartModel(catalog);
    // cart.catalog = catalog;
  }
}