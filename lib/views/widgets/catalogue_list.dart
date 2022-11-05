import 'package:catalogue_app/views/detail_view.dart';
import 'package:catalogue_app/views/widgets/catalogue_item.dart';
import 'package:flutter/material.dart';

import '../../models/catalogue.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // padding: const EdgeInsets.only(top: 50),
        itemCount: CatalogueModel.items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var item2 = CatalogueModel.items[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(catalog: item2),
                  ),
                );
              },
              child: CatalogueItem(item3: item2));
        });
  }
}
