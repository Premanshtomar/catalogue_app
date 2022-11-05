import 'package:catalogue_app/models/cart.dart';
import 'package:catalogue_app/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class MyVxStore extends VxStore{
  CatalogueModel catalog =CatalogueModel();
  CartModel cart = CartModel();


  MyVxStore(){
    // catalog = CatalogueModel();
    // cart = CartModel();
    cart.catalog = catalog;
  }
}