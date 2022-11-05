// import 'package:flutter/material.dart';
//
// import '../models/catalogue.dart';
//
// class ItemWidget extends StatelessWidget {
//   final Item item;
//   const ItemWidget({Key? key, required this.item,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Card(
//       margin: const EdgeInsets.all(16),
//       child: ListTile(
//         onTap: (){},
//         leading: Image.network(item.image),
//         title: Text(item.name),
//         subtitle: Text(item.desc),
//         trailing: Text('\$ ${item.price}',
//         style: const TextStyle(
//           color: Colors.deepPurple,
//               fontWeight: FontWeight.bold,
//         ),
//           textScaleFactor: 1.5,
//         ),
//       ),
//     );
//   }
// }
