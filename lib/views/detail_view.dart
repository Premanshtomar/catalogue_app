import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/utils/theme.dart';
import 'package:catalogue_app/views/widgets/add_to_cart.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final Item catalog;
  const DetailView({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            Text(
              '\$${catalog.price}',
              textScaleFactor: 3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade800,
              ),
            ),
            AddToCartWidget(catalog: catalog)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.cremeColor,
      body: Column(
        children: [
        Container(
          color: Colors.transparent,
          // margin: EdgeInsets.only(bottom: 64),
          child: Hero(tag: catalog.id.toString(),
          child: Image.network(catalog.image,height:MediaQuery.of(context).size.height*0.35,)
          ),
        ),
          Expanded(child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textScaleFactor: 3,
                  catalog.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                  color: MyTheme.darkBlue,
                  ),
                ),
                Text(catalog.desc,
                textScaleFactor: 1.7,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.darkBlue,
                ),
                ),
              ],
            ),
          ))
      ],
      )
    );
  }
}
