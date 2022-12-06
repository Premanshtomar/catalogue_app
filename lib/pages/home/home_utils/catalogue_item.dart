import 'package:flutter/material.dart';

import '../../../models/catalogue.dart';
import '../../../utils/theme.dart';
import 'add_to_cart.dart';

class CatalogueItem extends StatelessWidget {
  final Item item3;

  const CatalogueItem({Key? key, required this.item3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        // bottom: 16,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * 0.16,
      height: MediaQuery.of(context).size.height * 0.16,
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: MyTheme.cremeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Hero(
                  tag: item3.id.toString(), child: Image.network(item3.image))),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item3.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: MyTheme.darkBlue)),
              Text(item3.desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: MyTheme.darkBlue)),
              // const SizedBox(
              //   height: 14,
              // ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  Text(
                    '\$${item3.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.darkBlue,
                      fontSize: 20,
                    ),
                  ),
                  AddToCartWidget(
                    catalog: item3,
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
