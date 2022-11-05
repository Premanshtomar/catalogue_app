class CatalogueModel {

  static List<Item> items = [];

  Item getById(int id) => items.firstWhere(
        (element) => element.id == id,
      );

  Item getByPos(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      color: map['color'],
      image: map['image'],
      price: map['price'],
      desc: map['desc'],
      name: map['name'],
    );
  }

  toMap() => {
        'id': id,
        'color': color,
        'name': name,
        'price': price,
        'image': image,
        'desc': desc
      };
}
