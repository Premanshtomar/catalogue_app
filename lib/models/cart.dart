import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/views/widgets/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {

  late CatalogueModel _catalog;

  final List<int> ids = [];

  CatalogueModel get catalog => _catalog;

  set catalog(CatalogueModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => ids.map((id) => _catalog.getById(id)).toList();

  static num total = 0;

  num get totalPrice =>
      // items.fold(0,(current, now) => current! + 0);
      (items.fold(
          0.0, (previousValue, element) => (previousValue) + element.price));

  void add(Item item) {
    ids.add(item.id);
  }

  void remove(Item item) {
    ids.remove(item.id);
  }
}


class AddMutation extends VxMutation<MyVxStore>{
  Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart.ids.add(item.id);
  }

}
