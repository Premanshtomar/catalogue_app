import 'package:catalogue_app/views/widgets/vx_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalogue.dart';
import '../../utils/theme.dart';

class AddToCartWidget extends StatelessWidget {
  final Item catalog;


  const AddToCartWidget({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VxState.watch(context, on: [AddMutation(catalog)]);
    final CartModel cart = (VxState.store as MyVxStore).cart;
    final CatalogueModel _catalog = (VxState.store as MyVxStore).catalog;

    bool isAdded = cart.items.contains(catalog) ? true : false;

    return ElevatedButton(
      onPressed: () {
        if (!isAdded) {
          cart.catalog = _catalog;
          cart.add(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: isAdded
          ? const Icon(Icons.done)
          : Row(
              children: const [
                // Text(
                //   'Add to Cart ',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                Icon(CupertinoIcons.cart_badge_plus),
              ],
            ),
    );
  }
}
