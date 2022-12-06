import 'package:catalogue_app/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

import '../velocityx/vx_store.dart';

class CartModel {

  final CatalogueModel catalog;

  final List<int> ids = [];

  CartModel(this.catalog);

  List get items => ids.map((id) => catalog.getById(id)).toList();

  static num total = 0;

  num get totalPrice =>
      // items.fold(0,(current, now) => current! + 0);
      (items.fold(
          0.0, (previousValue, element) => (previousValue) + element.price));

}


class AddMutation extends VxMutation<MyVxStore>{
  Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart.ids.add(item.id);
  }

}


class RemoveMutation extends VxMutation<MyVxStore>{
  Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart.ids.remove(item.id);
  }

}
